#!/usr/bin/env python3

import numpy as np
import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity
from typing import List, Dict, Optional
import requests
import time
import warnings
warnings.filterwarnings('ignore')


class RealTimeJobFetcher:
    def __init__(self):
        self.sources = {
            "arbeitnow": {
                "url": "https://www.arbeitnow.com/api/job-board-api",
                "parser": self._parse_arbeitnow
            },
            "remotive": {
                "url": "https://remotive.com/api/remote-jobs",
                "parser": self._parse_remotive
            },
            "themuse": {
                "url": "https://www.themuse.com/api/public/jobs",
                "parser": self._parse_themuse
            }
        }

    def fetch_jobs(self, source_name: str, pages: int = 1) -> List[Dict]:
        source = self.sources.get(source_name.lower())
        if not source:
            raise ValueError(f"Unknown job source: {source_name}")

        jobs = []

        if source_name == "themuse":
            for page in range(pages):
                try:
                    params = {'category': 'Internship', 'page': page, 'descending': 'true'}
                    response = requests.get(source['url'], params=params, timeout=10)
                    if response.status_code == 200:
                        data = response.json()
                        jobs.extend(source["parser"](data))
                    else:
                        break
                    time.sleep(0.5)
                except:
                    break
        else:
            try:
                response = requests.get(source['url'], timeout=15)
                if response.status_code == 200:
                    data = response.json()
                    jobs = source["parser"](data)
            except:
                pass

        return jobs

    def _parse_arbeitnow(self, data: Dict) -> List[Dict]:
        jobs = []
        for job in data.get('data', []):
            title = job.get('title', '').lower()
            if any(k in title for k in ['intern', 'junior', 'entry', 'graduate', 'trainee']):
                jobs.append({
                    'source': 'Arbeitnow',
                    'job_id': f"arbeit_{job.get('slug', '')}",
                    'company': job.get('company_name', 'Unknown'),
                    'title': job.get('title', ''),
                    'location': job.get('location', 'Remote'),
                    'description': job.get('description', '')[:1000],
                    'category': ', '.join(job.get('tags', [])),
                    'url': job.get('url', ''),
                    'posted_date': job.get('created_at', ''),
                })
        return jobs

    def _parse_remotive(self, data: Dict) -> List[Dict]:
        jobs = []
        for job in data.get('jobs', []):
            title = job.get('title', '').lower()
            if any(k in title for k in ['intern', 'junior', 'entry', 'graduate']):
                jobs.append({
                    'source': 'Remotive',
                    'job_id': f"remotive_{job.get('id', '')}",
                    'company': job.get('company_name', 'Unknown'),
                    'title': job.get('title', ''),
                    'location': 'Remote',
                    'description': job.get('description', '')[:1000],
                    'category': job.get('category', ''),
                    'url': job.get('url', ''),
                    'posted_date': job.get('publication_date', ''),
                })
        return jobs

    def _parse_themuse(self, data: Dict) -> List[Dict]:
        jobs = []
        for job in data.get('results', []):
            locations = job.get('locations', [])
            location_str = ', '.join([loc.get('name', '') for loc in locations]) if locations else 'Remote'
            categories = job.get('categories', [])
            category_str = ', '.join([cat.get('name', '') for cat in categories]) if categories else ''
            jobs.append({
                'source': 'TheMuse',
                'job_id': f"muse_{job.get('id')}",
                'company': job.get('company', {}).get('name', 'Unknown'),
                'title': job.get('name', ''),
                'location': location_str,
                'description': job.get('contents', '')[:1000],
                'category': category_str,
                'url': job.get('refs', {}).get('landing_page', ''),
                'posted_date': job.get('publication_date', ''),
            })
        return jobs

    def fetch_all(self, muse_pages: int = 5) -> List[Dict]:
        all_jobs = []
        for name in self.sources.keys():
            jobs = self.fetch_jobs(name, pages=muse_pages if name == "themuse" else 1)
            all_jobs.extend(jobs)
            time.sleep(1)
        return all_jobs


class InternshipRecommender:
    def __init__(self):
        self.vectorizer = TfidfVectorizer(
            max_features=200,
            stop_words='english',
            ngram_range=(1, 2),
            min_df=1
        )
        self.internships_df = None
        self.internship_vectors = None
        self.fetcher = RealTimeJobFetcher()

    def fetch_and_load_data(self):
        jobs = self.fetcher.fetch_all()
        if not jobs:
            raise ValueError("Unable to fetch jobs. Check connection.")

        self.internships_df = pd.DataFrame(jobs)
        self.internships_df['combined_features'] = (
            self.internships_df['title'].fillna('') + ' ' +
            self.internships_df['description'].fillna('') + ' ' +
            self.internships_df['category'].fillna('')
        ).str.lower()

        self.internships_df['location'] = self.internships_df['location'].fillna('Remote')
        self.internships_df['company'] = self.internships_df['company'].fillna('Unknown')

    def train(self):
        if self.internships_df is None or len(self.internships_df) == 0:
            raise ValueError("No data for training.")
        self.internship_vectors = self.vectorizer.fit_transform(
            self.internships_df['combined_features']
        )

    def recommend(self, skills: List[str], interests: List[str], location: Optional[str] = None) -> pd.DataFrame:
        if self.internship_vectors is None:
            raise ValueError("Model not trained.")

        user_profile = ' '.join(skills + interests).lower()
        keywords = [k.lower() for k in skills + interests]

        keyword_mask = self.internships_df['combined_features'].apply(
            lambda text: any(k in text for k in keywords)
        )
        filtered_df = self.internships_df[keyword_mask].copy()

        if location:
            filtered_df = filtered_df[filtered_df['location'].str.contains(location, case=False, na=False)]

        if len(filtered_df) == 0:
            filtered_df = self.internships_df.copy()

        filtered_df['weighted_text'] = (
            (filtered_df['title'].fillna('') + ' ') * 3 +
            (filtered_df['category'].fillna('') + ' ') * 2 +
            filtered_df['description'].fillna('')
        ).str.lower()

        vectors = self.vectorizer.transform(filtered_df['weighted_text'])
        user_vector = self.vectorizer.transform([user_profile])
        similarities = cosine_similarity(user_vector, vectors).flatten()

        filtered_df['match_score'] = similarities
        filtered_df['match_percentage'] = (similarities * 100).round(2)

        top_results = filtered_df.nlargest(5, 'match_score')

        return top_results[['company', 'title', 'location', 'match_percentage', 'source', 'url', 'description']]


def main():
    print("="*60)
    print("INTERNSHIP RECOMMENDATION SYSTEM")
    print("="*60)

    print("Enter your skills (comma-separated):")
    skills = [s.strip() for s in input("> ").strip().split(',') if s.strip()] or ['python']

    print("Enter your interests (comma-separated):")
    interests = [i.strip() for i in input("> ").strip().split(',') if i.strip()] or ['technology']

    print("Enter preferred location:")
    location = input("> ").strip() or None

    recommender = InternshipRecommender()

    try:
        recommender.fetch_and_load_data()
        recommender.train()
        recommendations = recommender.recommend(skills, interests, location)

        if len(recommendations) == 0:
            print("No matching internships found.")
            return

        print("="*60)
        print("TOP INTERNSHIP RECOMMENDATIONS")
        print("="*60)

        for idx, (_, row) in enumerate(recommendations.iterrows(), 1):
            print(f"{idx}. {row['title']}")
            print(f"   Company: {row['company']}")
            print(f"   Location: {row['location']}")
            print(f"   Match: {row['match_percentage']}%")
            print(f"   Apply: {row['url']}")
            print("")

        print("="*60)

    except Exception as e:
        print(f"Error: {e}")


if __name__ == "__main__":
    main()

