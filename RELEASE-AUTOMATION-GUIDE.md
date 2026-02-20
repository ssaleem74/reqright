# ReqRight — Automated Version Control & Release Guide

## Overview

This guide sets up an automated workflow where:

1. You develop and commit using **structured commit messages**
2. When ready to release, you run **one script** to bump the version
3. Pushing to GitHub **automatically** deploys to GitHub Pages and creates a release with notes

```
Your Machine                          GitHub
───────────                           ──────
                                      
  Write code                          
      │                               
  git commit -m "feat: add sidebar"   
  git commit -m "fix: search focus"   
      │                               
  ./scripts/bump-version.sh minor     
      │                               
  git push origin main --tags ──────► GitHub Actions triggers:
                                        │
                                        ├── Deploy to Pages (live site updated)
                                        │
                                        └── Create Release (with auto-generated notes)
                                              │
                                              ├── v2.3.0 Release created
                                              ├── Changelog attached
                                              └── reqright.html downloadable
```

---

## Step 1: Structured Commit Messages

The automation relies on **Conventional Commits** — a simple prefix system that tells the tools what kind of change you made. This is the only habit you need to build.

### Format

```
type(scope): short description
```

### Types

| Prefix | Meaning | Version Impact | Example |
|:-------|:--------|:--------------|:--------|
| `feat:` | New feature | Minor bump (2.2 → 2.3) | `feat: add Decision Log module` |
| `fix:` | Bug fix | Patch bump (2.2.0 → 2.2.1) | `fix: search input loses focus` |
| `ui:` | UI/UX change | Patch bump | `ui: restructure sidebar layout` |
| `docs:` | Documentation | No bump | `docs: update README with new screenshots` |
| `chore:` | Maintenance | No bump | `chore: clean up unused CSS variables` |
| `refactor:` | Code restructure | No bump | `refactor: extract risk matrix into function` |
| `perf:` | Performance | Patch bump | `perf: debounce search input rendering` |

### Real Examples From v2.2.0 Development

Instead of:
```
git commit -m "updated stuff"
git commit -m "more changes"
git commit -m "fixed bug"
```

Use:
```
git commit -m "feat: add Decision Log module with full lifecycle tracking"
git commit -m "ui: restructure Author view with 3-column sidebar layout"
git commit -m "fix: search input focus lost on keystroke"
git commit -m "feat: add filter dropdowns to Risk and Decision sidebars"
git commit -m "ui: replace traceability flat cards with indented tree view"
git commit -m "feat: expand V&V view with requirement listings per method"
git commit -m "fix: filter dropdown reset when selecting All"
git commit -m "ui: consolidate header into File dropdown menu"
git commit -m "docs: update CHANGELOG for v2.2.0-beta"
```

These messages are then **automatically** turned into categorised release notes.

---

## Step 2: Set Up Your Repository

### 2.1 Add the Workflow Files

Copy these files into your repository:

```
reqright/
├── .github/
│   └── workflows/
│       ├── deploy.yml       ← Auto-deploy to GitHub Pages
│       └── release.yml      ← Auto-create releases on tag push
├── scripts/
│   └── bump-version.sh     ← Version bump helper
├── reqright.html            ← Your application
├── index.html               ← Landing page
├── CHANGELOG.md             ← Auto-updated by bump script
├── README.md
├── LICENSE
└── ...
```

### 2.2 Enable GitHub Pages

1. Go to your repo → **Settings** → **Pages**
2. Under "Build and deployment", select **Source: GitHub Actions**
3. Save

### 2.3 Make the Script Executable

```bash
chmod +x scripts/bump-version.sh
```

### 2.4 Enable Workflow Permissions

1. Go to repo → **Settings** → **Actions** → **General**
2. Under "Workflow permissions", select **Read and write permissions**
3. Save

---

## Step 3: Daily Development Workflow

### Typical Session

```bash
# 1. Make your changes to reqright.html
#    (work with Claude, edit manually, etc.)

# 2. Commit with a conventional message
git add reqright.html
git commit -m "feat: add Stakeholder Register module"

# 3. More changes...
git add reqright.html
git commit -m "fix: stakeholder link navigation"

# 4. Push to main (auto-deploys to GitHub Pages)
git push origin main
```

At this point, your live site is updated but no formal "release" is created yet. You can push as many commits as you like during development.

### When Ready to Release

```bash
# Run the bump script
./scripts/bump-version.sh minor

# Output:
# Current version: v2.2.0-beta
# New version:     v2.3.0
# 
# Proceed with version bump to v2.3.0? (y/N): y
#
# [1/5] Updating version in reqright.html...  ✓
# [2/5] Updating CHANGELOG.md...              ✓
# [3/5] Staging changes...                    ✓
# [4/5] Creating release commit...            ✓
# [5/5] Creating git tag v2.3.0...            ✓
#
# Next steps:
#   1. Review: git log --oneline -5
#   2. Push:   git push origin main --tags

# Push with tags
git push origin main --tags
```

This triggers both GitHub Actions:
- **deploy.yml** → Updates your live GitHub Pages site
- **release.yml** → Creates a GitHub Release like:

```
Release: ReqRight v2.3.0
──────────────────────────

## What's Changed in v2.3.0

### ✨ New Features
- add Stakeholder Register module
- add filter dropdowns to all sidebars

### 🐛 Bug Fixes  
- stakeholder link navigation
- search focus loss in glossary

### 🎨 UI/UX Improvements
- restructure sidebar with 3-column layout

Full Changelog: compare/v2.2.0...v2.3.0

Assets:
  📎 reqright.html
  📎 CHANGELOG.md
```

---

## Step 4: Version Numbering Guide

### Semantic Versioning: MAJOR.MINOR.PATCH

| Change Type | Bump | Example | When |
|:-----------|:-----|:--------|:-----|
| Breaking change | Major | 2.x → 3.0.0 | Data format change, removed features |
| New feature | Minor | 2.2 → 2.3.0 | New module, new view, new capability |
| Bug fix / polish | Patch | 2.2.0 → 2.2.1 | Fix crash, UI tweak, typo |

### Pre-release Labels

```bash
./scripts/bump-version.sh minor beta     → v2.3.0-beta
./scripts/bump-version.sh minor alpha    → v2.3.0-alpha
./scripts/bump-version.sh minor rc       → v2.3.0-rc
./scripts/bump-version.sh minor          → v2.3.0  (stable)
```

### ReqRight Version History (for reference)

```
v0.1.0       Initial release — core requirements authoring
v1.0.0       AI improvement engine, enhanced UI
v1.1.0       Tutorial, test plan, landing page
v2.0.0       Risk Register module
v2.1.0-beta  Rebranding to ReqRight, legal docs, release prep
v2.2.0-beta  Decision Log, complete UX overhaul, sidebar layouts
v2.3.0       ← Next: Stakeholder Register (planned)
```

---

## How It All Connects

```
┌─────────────────────────────────────────────────────────────────┐
│                    YOUR DEVELOPMENT CYCLE                        │
│                                                                  │
│  ┌──────────┐    ┌──────────┐    ┌───────────┐                  │
│  │  Develop  │───►│  Commit  │───►│   Push    │                  │
│  │  changes  │    │  feat:   │    │  to main  │                  │
│  │           │    │  fix:    │    │           │                  │
│  └──────────┘    │  ui:     │    └─────┬─────┘                  │
│                  └──────────┘          │                         │
│                                        │  ← Auto-deploys        │
│                                        │     to GitHub Pages    │
│                                        ▼                         │
│                              ┌──────────────────┐               │
│                              │  Live site updated │               │
│                              │  (no release yet)  │               │
│                              └──────────────────┘               │
│                                                                  │
│  When ready to release:                                          │
│                                                                  │
│  ┌───────────────┐    ┌──────────┐    ┌──────────────────┐      │
│  │ bump-version  │───►│ Push     │───►│ GitHub Actions   │      │
│  │   .sh minor   │    │ --tags   │    │ creates Release  │      │
│  │               │    │          │    │ with auto notes  │      │
│  │ • Updates HTML│    │          │    │ • ✨ Features     │      │
│  │ • Updates LOG │    │          │    │ • 🐛 Fixes       │      │
│  │ • Creates tag │    │          │    │ • 📎 Downloads   │      │
│  └───────────────┘    └──────────┘    └──────────────────┘      │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## Quick Reference Card

### Daily Commands

```bash
# After making changes:
git add .
git commit -m "feat: description of new feature"
git push origin main

# Fix a bug:
git add .
git commit -m "fix: description of what was fixed"
git push origin main

# UI improvement:
git add .
git commit -m "ui: description of visual change"
git push origin main
```

### Release Commands

```bash
# Bug fix release (2.2.0 → 2.2.1):
./scripts/bump-version.sh patch
git push origin main --tags

# Feature release (2.2.1 → 2.3.0):
./scripts/bump-version.sh minor
git push origin main --tags

# Major release (2.3.0 → 3.0.0):
./scripts/bump-version.sh major
git push origin main --tags

# Beta release (2.2.0 → 2.3.0-beta):
./scripts/bump-version.sh minor beta
git push origin main --tags
```

### Check Status

```bash
# See current version:
git tag --sort=-version:refnum | head -5

# See commits since last release:
git log $(git describe --tags --abbrev=0)..HEAD --oneline

# See all releases:
git tag -l 'v*' --sort=-version:refnum
```

---

## Troubleshooting

### "Permission denied" on bump script
```bash
chmod +x scripts/bump-version.sh
```

### GitHub Actions not triggering
- Check Settings → Actions → General → "Allow all actions" is enabled
- Check Settings → Pages → Source is "GitHub Actions"
- Check Settings → Actions → General → Workflow permissions is "Read and write"

### Tag already exists
```bash
# Delete local tag
git tag -d v2.3.0
# Delete remote tag (if pushed)
git push origin :refs/tags/v2.3.0
# Re-run bump script
./scripts/bump-version.sh minor
```

### Want to see what the release will look like before pushing
```bash
# Dry run — bump script will show the version but you can cancel
./scripts/bump-version.sh minor
# At the "Proceed?" prompt, type N to cancel
```
