<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Complete Your Profile</title>

    <!-- Bootstrap 5 CSS (CDN) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome (optional, CDN) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        /* Page-specific minimal styles to center the form card */
        body { background: #f6f8fb; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Arial; }
        .site-container { max-width: 900px; margin: 40px auto; padding: 0 16px; }
        .form-card { border-radius: 10px; box-shadow: 0 8px 20px rgba(20,20,50,0.06); background: #fff; padding: 24px; }
        .form-header { margin-bottom: 18px; }
        .form-note { font-size: 0.9rem; color: #6c757d; }
    </style>
</head>
<body>

<!-- Header / Navbar (keeps same style as other pages; does not modify any shared files) -->
<header class="site-header py-3" style="background: linear-gradient(90deg, #0d6efd, #0b5ed7); color:#fff;">
    <div class="container d-flex align-items-center justify-content-between">
        <div class="brand fw-bold"><i class="fas fa-graduation-cap me-2"></i>PM Internship Portal</div>
        <div>
            <!-- Links point to existing routes; not modifying other pages -->
            <a href="dashboard.jsp" class="btn btn-outline-light btn-sm me-2">Dashboard</a>
            <a href="profile" class="btn btn-light btn-sm">Profile</a>
        </div>
    </div>
</header>

<main class="site-container">
    <!-- Centered card layout for the profile form -->
    <div class="form-card">
        <!-- Form header -->
        <!-- Title: Complete Your Profile -->
        <div class="form-header">
            <h2 class="mb-1">Complete Your Profile</h2>
            <p class="form-note mb-0">Provide the details below to get better internship recommendations. This is a frontend-only form (POST target is a future servlet).</p>
        </div>

        <!-- Profile form: posts to SubmitProfileServlet (future) -->
        <form action="SubmitProfileServlet" method="POST" novalidate>

            <!-- Full Name (text) -->
            <div class="mb-3">
                <label for="fullName" class="form-label">Full Name</label>
                <input type="text" class="form-control" id="fullName" name="fullName" placeholder="e.g. Jane Doe" required />
                <div class="form-text">Enter your full name as you'd like it displayed.</div>
            </div>

            <!-- Contact (email or phone) -->
            <div class="mb-3">
                <label for="contact" class="form-label">Contact</label>
                <input type="text" class="form-control" id="contact" name="contact" placeholder="Email or phone (e.g. jane@example.com or +911234567890)" required />
            </div>

            <!-- Education Qualification (dropdown) -->
            <div class="mb-3">
                <label for="qualification" class="form-label">Education Qualification</label>
                <select class="form-select" id="qualification" name="qualification" required>
                    <option value="" selected disabled>Choose qualification</option>
                    <option>Diploma</option>
                    <option>B.Sc</option>
                    <option>B.A</option>
                    <option>B.Com</option>
                    <option>B.Tech</option>
                    <option>M.Tech</option>
                    <option>M.Sc</option>
                    <option>Degree</option>
                    <option>Other</option>
                </select>
            </div>

            <!-- Current Course (text) -->
            <div class="mb-3">
                <label for="currentCourse" class="form-label">Current Course</label>
                <input type="text" class="form-control" id="currentCourse" name="currentCourse" placeholder="e.g. B.Tech in Computer Science" />
            </div>

            <!-- Branch / Major (text) -->
            <div class="mb-3">
                <label for="branch" class="form-label">Branch / Major</label>
                <input type="text" class="form-control" id="branch" name="branch" placeholder="e.g. Computer Science" />
            </div>

            <!-- Year / Semester (dropdown) -->
            <div class="mb-3">
                <label for="yearSem" class="form-label">Year / Semester</label>
                <select class="form-select" id="yearSem" name="yearSem">
                    <option value="" selected disabled>Select year or semester</option>
                    <option>1st Year</option>
                    <option>2nd Year</option>
                    <option>3rd Year</option>
                    <option>4th Year</option>
                    <option>1st Semester</option>
                    <option>2nd Semester</option>
                    <option>3rd Semester</option>
                    <option>4th Semester</option>
                </select>
            </div>

            <!-- Preferred Locations (multi-select) -->
            <div class="mb-3">
                <label for="locations" class="form-label">Preferred Locations</label>
                <select multiple class="form-select" id="locations" name="locations">
                    <option>Remote</option>
                    <option>Bangalore</option>
                    <option>Kochi</option>
                    <option>Chennai</option>
                    <option>Mumbai</option>
                    <option>Hyderabad</option>
                    <option>Delhi</option>
                    <option>Pune</option>
                </select>
                <div class="form-text">Hold Ctrl (or Cmd) and click to select multiple locations.</div>
            </div>

            <!-- Skills (comma-separated) -->
            <div class="mb-3">
                <label for="skills" class="form-label">Skills</label>
                <input type="text" class="form-control" id="skills" name="skills" placeholder="e.g. Python, Java, HTML" />
                <div class="form-text">Enter skills as comma-separated values.</div>
            </div>

            <!-- Interests (textarea) -->
            <div class="mb-3">
                <label for="interests" class="form-label">Interests</label>
                <textarea class="form-control" id="interests" name="interests" rows="3" placeholder="Describe your interests or career goals"></textarea>
            </div>

            <!-- Preferred Mode (dropdown) -->
            <div class="mb-3">
                <label for="mode" class="form-label">Preferred Mode</label>
                <select class="form-select" id="mode" name="mode">
                    <option value="" selected disabled>Select mode</option>
                    <option>Online</option>
                    <option>Offline</option>
                    <option>Hybrid</option>
                </select>
            </div>

            <!-- Experience Level (dropdown) -->
            <div class="mb-3">
                <label for="experienceLevel" class="form-label">Experience Level</label>
                <select class="form-select" id="experienceLevel" name="experienceLevel">
                    <option value="" selected disabled>Select level</option>
                    <option>Beginner</option>
                    <option>Intermediate</option>
                    <option>Advanced</option>
                </select>
            </div>

            <!-- Languages Known (comma-separated) -->
            <div class="mb-3">
                <label for="languages" class="form-label">Languages Known</label>
                <input type="text" class="form-control" id="languages" name="languages" placeholder="e.g. English, Hindi, Malayalam" />
                <div class="form-text">Enter languages as comma-separated values.</div>
            </div>

            <!-- Submit button -->
            <div class="d-flex justify-content-end mt-4">
                <button type="submit" class="btn btn-primary me-2">Submit Profile</button>
                <a href="dashboard.jsp" class="btn btn-outline-secondary">Cancel</a>
            </div>

        </form>
    </div>
</main>

<!-- Bootstrap bundle (JS) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<!--
    Notes:
    - This file is frontend-only. It POSTs to `SubmitProfileServlet` which should be implemented later.
    - All inputs include placeholders and helper text where useful.
    - No existing files were modified.
-->

</body>
</html>