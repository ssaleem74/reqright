#!/bin/bash
# =============================================================================
# ReqRight Version Bump Script
# Usage: ./scripts/bump-version.sh <major|minor|patch> [label]
#
# Examples:
#   ./scripts/bump-version.sh patch              → 2.2.0 → 2.2.1
#   ./scripts/bump-version.sh minor              → 2.2.1 → 2.3.0
#   ./scripts/bump-version.sh major              → 2.3.0 → 3.0.0
#   ./scripts/bump-version.sh minor beta         → 2.2.0 → 2.3.0-beta
# =============================================================================

set -e

# Colours for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No colour

BUMP_TYPE=${1:-patch}
LABEL=${2:-}

# Validate input
if [[ "$BUMP_TYPE" != "major" && "$BUMP_TYPE" != "minor" && "$BUMP_TYPE" != "patch" ]]; then
    echo -e "${RED}Error: Bump type must be 'major', 'minor', or 'patch'${NC}"
    echo "Usage: $0 <major|minor|patch> [label]"
    exit 1
fi

# Check we're in a git repo
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo -e "${RED}Error: Not in a git repository${NC}"
    exit 1
fi

# Check for uncommitted changes
if ! git diff-index --quiet HEAD -- 2>/dev/null; then
    echo -e "${YELLOW}Warning: You have uncommitted changes. Commit them first.${NC}"
    echo ""
    git status --short
    echo ""
    read -p "Continue anyway? (y/N): " CONFIRM
    if [[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]]; then
        exit 1
    fi
fi

# Get current version from the latest git tag, or from the HTML file
CURRENT_TAG=$(git tag --sort=-version:refnum | grep '^v' | head -1 2>/dev/null || echo "")
if [ -n "$CURRENT_TAG" ]; then
    CURRENT_VERSION="${CURRENT_TAG#v}"
    # Strip any label (e.g., -beta) for numeric comparison
    CURRENT_CLEAN=$(echo "$CURRENT_VERSION" | sed 's/-.*//')
else
    # Try to extract from HTML file
    CURRENT_CLEAN=$(grep -oP 'v\K[0-9]+\.[0-9]+\.[0-9]+' reqright.html | head -1 || echo "0.0.0")
    CURRENT_VERSION="$CURRENT_CLEAN"
fi

echo -e "${BLUE}Current version: ${YELLOW}v${CURRENT_VERSION}${NC}"

# Calculate new version
IFS='.' read -r MAJOR MINOR PATCH <<< "$CURRENT_CLEAN"

case $BUMP_TYPE in
    major)
        MAJOR=$((MAJOR + 1))
        MINOR=0
        PATCH=0
        ;;
    minor)
        MINOR=$((MINOR + 1))
        PATCH=0
        ;;
    patch)
        PATCH=$((PATCH + 1))
        ;;
esac

NEW_VERSION="${MAJOR}.${MINOR}.${PATCH}"
if [ -n "$LABEL" ]; then
    NEW_VERSION="${NEW_VERSION}-${LABEL}"
fi

echo -e "${BLUE}New version:     ${GREEN}v${NEW_VERSION}${NC}"
echo ""

# Confirm
read -p "Proceed with version bump to v${NEW_VERSION}? (y/N): " CONFIRM
if [[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]]; then
    echo "Cancelled."
    exit 0
fi

# ─── 1. Update version in reqright.html ───
echo -e "${BLUE}[1/5] Updating version in reqright.html...${NC}"

if [ -f "reqright.html" ]; then
    # Update all version references
    sed -i "s/ReqRight v${CURRENT_CLEAN}[^\"']*/ReqRight v${NEW_VERSION}/g" reqright.html
    sed -i "s/version:\"${CURRENT_CLEAN}\"/version:\"${MAJOR}.${MINOR}\"/g" reqright.html
    echo -e "  ${GREEN}✓ Updated HTML version references${NC}"
else
    echo -e "  ${YELLOW}⚠ reqright.html not found, skipping${NC}"
fi

# ─── 2. Update CHANGELOG.md ───
echo -e "${BLUE}[2/5] Updating CHANGELOG.md...${NC}"

DATE=$(date +%Y-%m-%d)
PREV_TAG=$(git tag --sort=-version:refnum | grep '^v' | head -1 2>/dev/null || echo "")

# Generate changelog entry from commits since last tag
if [ -n "$PREV_TAG" ]; then
    RANGE="${PREV_TAG}..HEAD"
else
    RANGE="HEAD"
fi

CHANGELOG_ENTRY="## [${NEW_VERSION}] — ${DATE}\n\n"

# Collect commits by type
FEATS=$(git log $RANGE --pretty=format:"- %s" --grep="^feat" 2>/dev/null | sed 's/- feat[:(][^)]*): /- /;s/- feat: /- /')
FIXES=$(git log $RANGE --pretty=format:"- %s" --grep="^fix" 2>/dev/null | sed 's/- fix[:(][^)]*): /- /;s/- fix: /- /')
STYLE=$(git log $RANGE --pretty=format:"- %s" --grep="^style\|^ui\|^ux" 2>/dev/null | sed 's/- [a-z]*[:(][^)]*): /- /;s/- [a-z]*: /- /')
DOCS=$(git log $RANGE --pretty=format:"- %s" --grep="^docs" 2>/dev/null | sed 's/- docs[:(][^)]*): /- /;s/- docs: /- /')
OTHER=$(git log $RANGE --pretty=format:"- %s" --grep="^chore\|^refactor\|^perf" 2>/dev/null | sed 's/- [a-z]*[:(][^)]*): /- /;s/- [a-z]*: /- /')

if [ -n "$FEATS" ]; then
    CHANGELOG_ENTRY+="### Added\n${FEATS}\n\n"
fi
if [ -n "$FIXES" ]; then
    CHANGELOG_ENTRY+="### Fixed\n${FIXES}\n\n"
fi
if [ -n "$STYLE" ]; then
    CHANGELOG_ENTRY+="### Changed\n${STYLE}\n\n"
fi
if [ -n "$DOCS" ]; then
    CHANGELOG_ENTRY+="### Documentation\n${DOCS}\n\n"
fi
if [ -n "$OTHER" ]; then
    CHANGELOG_ENTRY+="### Other\n${OTHER}\n\n"
fi

CHANGELOG_ENTRY+="---\n\n"

if [ -f "CHANGELOG.md" ]; then
    # Insert new entry after the header
    TEMP=$(mktemp)
    awk -v entry="$CHANGELOG_ENTRY" '
    /^## \[/ && !inserted {
        printf "%s", entry
        inserted=1
    }
    {print}
    ' CHANGELOG.md > "$TEMP"
    
    # If no existing ## section found, append after first ---
    if ! grep -q "inserted" <<< "$(diff CHANGELOG.md "$TEMP")"; then
        echo -e "$CHANGELOG_ENTRY$(cat CHANGELOG.md)" > "$TEMP"
    fi
    
    mv "$TEMP" CHANGELOG.md
    echo -e "  ${GREEN}✓ Updated CHANGELOG.md${NC}"
else
    echo -e "# Changelog\n\nAll notable changes to ReqRight are documented in this file.\n\n---\n\n${CHANGELOG_ENTRY}" > CHANGELOG.md
    echo -e "  ${GREEN}✓ Created CHANGELOG.md${NC}"
fi

# ─── 3. Stage changes ───
echo -e "${BLUE}[3/5] Staging changes...${NC}"
git add reqright.html CHANGELOG.md 2>/dev/null || true
echo -e "  ${GREEN}✓ Files staged${NC}"

# ─── 4. Commit ───
echo -e "${BLUE}[4/5] Creating release commit...${NC}"
git commit -m "chore(release): v${NEW_VERSION}

Bump version to ${NEW_VERSION}
Updated CHANGELOG.md with release notes" 2>/dev/null || echo -e "  ${YELLOW}⚠ Nothing to commit${NC}"
echo -e "  ${GREEN}✓ Committed${NC}"

# ─── 5. Create tag ───
echo -e "${BLUE}[5/5] Creating git tag v${NEW_VERSION}...${NC}"
git tag -a "v${NEW_VERSION}" -m "Release v${NEW_VERSION}"
echo -e "  ${GREEN}✓ Tag created${NC}"

echo ""
echo -e "${GREEN}═══════════════════════════════════════════════════${NC}"
echo -e "${GREEN}  Version bumped to v${NEW_VERSION} successfully!${NC}"
echo -e "${GREEN}═══════════════════════════════════════════════════${NC}"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo -e "  ${BLUE}1.${NC} Review the changes:  ${YELLOW}git log --oneline -5${NC}"
echo -e "  ${BLUE}2.${NC} Push to GitHub:      ${YELLOW}git push origin main --tags${NC}"
echo ""
echo -e "  This will automatically:"
echo -e "  • Deploy to GitHub Pages"
echo -e "  • Create a GitHub Release with release notes"
echo -e "  • Attach reqright.html and CHANGELOG.md to the release"
echo ""
