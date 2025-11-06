#!/usr/bin/env python3
"""
Simple WAR packer for this repository.
It will:
 - find AiInternshipPortal/src/main/webapp as webapp root
 - collect compiled classes from AiInternshipPortal/build/classes and AiInternshipPortal/temp/WEB-INF/classes
 - collect any .jar files under root/lib or AiInternshipPortal/lib
 - create internship-recommendation.war at the repo root

Run: python create_war.py
"""
import os
import zipfile
from pathlib import Path

root = Path(__file__).resolve().parent
war_name = root / 'internship-recommendation.war'
webapp_dir = root / 'AiInternshipPortal' / 'src' / 'main' / 'webapp'
class_dirs = [root / 'AiInternshipPortal' / 'build' / 'classes',
              root / 'AiInternshipPortal' / 'temp' / 'WEB-INF' / 'classes',
              webapp_dir / 'WEB-INF' / 'classes']
search_jars = [root / 'lib', root / 'AiInternshipPortal' / 'lib']

entries = []

if not webapp_dir.exists():
    print(f"Warning: webapp directory not found at {webapp_dir}")
else:
    # add webapp files (JSPs, css, META-INF, WEB-INF/web.xml ..)
    for p in webapp_dir.rglob('*'):
        if p.is_file():
            arcname = os.path.relpath(p, webapp_dir)
            entries.append((str(p), arcname))

# add classes into WEB-INF/classes
for cdir in class_dirs:
    if cdir.exists():
        for p in cdir.rglob('*.class'):
            rel = os.path.relpath(p, cdir)
            arcname = os.path.join('WEB-INF', 'classes', rel).replace('\\', '/')
            entries.append((str(p), arcname))

# add jars into WEB-INF/lib
jars_added = 0
jars_excluded = 0
for jdir in search_jars:
    if jdir.exists():
        for p in jdir.rglob('*.jar'):
            # avoid bundling servlet API implementations into the WAR
            low = p.name.lower()
            if 'servlet' in low or 'jakarta.servlet' in low or 'javax.servlet' in low:
                jars_excluded += 1
                continue
            arcname = os.path.join('WEB-INF', 'lib', p.name).replace('\\', '/')
            entries.append((str(p), arcname))
            jars_added += 1

# If there are any .class files under AiInternshipPortal/temp/WEB-INF/classes already structured as WEB-INF/classes,
# the above will add them under WEB-INF/classes as well.

# Remove duplicates preserving first occurrence
seen = set()
unique_entries = []
for src, arc in entries:
    if arc not in seen:
        seen.add(arc)
        unique_entries.append((src, arc))

if not unique_entries:
    print('No files found to include in WAR. Aborting.')
    raise SystemExit(1)

# create WAR (zip)
with zipfile.ZipFile(str(war_name), 'w', compression=zipfile.ZIP_DEFLATED) as zf:
    for src, arc in unique_entries:
        zf.write(src, arc)

print(f'WAR created: {war_name} (entries: {len(unique_entries)}, jars: {jars_added}, jars_excluded: {jars_excluded})')
print('Top entries:')
with zipfile.ZipFile(str(war_name), 'r') as zf:
    for i, n in enumerate(zf.namelist()[:40], 1):
        print(f'{i:3d}: {n}')

print('\nTo deploy: copy the WAR to your Tomcat webapps directory and start Tomcat (or restart).')
