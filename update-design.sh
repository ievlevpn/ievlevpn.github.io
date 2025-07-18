#!/bin/bash

# Academic Website Template - Design Update Script
# This script updates design files while preserving your content

set -e

echo "🎨 Academic Website Design Updater"
echo "==================================="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo -e "${RED}❌ Error: This script must be run from the root of your git repository${NC}"
    exit 1
fi

# Check if there are uncommitted changes
if ! git diff --quiet || ! git diff --cached --quiet; then
    echo -e "${YELLOW}⚠️  Warning: You have uncommitted changes.${NC}"
    echo "Please commit your changes before updating the design."
    echo ""
    echo "Current status:"
    git status --short
    echo ""
    read -p "Continue anyway? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Update cancelled."
        exit 1
    fi
fi

echo -e "${BLUE}📦 Downloading latest template...${NC}"

# Create temporary directory
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

# Download latest template
if ! curl -L "https://github.com/mechanicpanic/academic-website/archive/main.zip" -o template.zip; then
    echo -e "${RED}❌ Failed to download template${NC}"
    exit 1
fi

# Extract template
if ! unzip -q template.zip; then
    echo -e "${RED}❌ Failed to extract template${NC}"
    exit 1
fi

cd academic-website-main

# Go back to original directory
cd "$OLDPWD"

echo -e "${YELLOW}🔄 Updating design files...${NC}"

# Files to update (design/template files only)
DESIGN_FILES=(
    "_layouts"
    "_includes" 
    "_sass"
    "assets/css"
    ".github/workflows"
    "update-design.sh"
)

# Backup current design files
echo -e "${BLUE}💾 Creating backup...${NC}"
mkdir -p .design-backup
for file in "${DESIGN_FILES[@]}"; do
    if [ -e "$file" ]; then
        cp -r "$file" ".design-backup/" 2>/dev/null || true
    fi
done

# Update design files
for file in "${DESIGN_FILES[@]}"; do
    if [ -e "$TEMP_DIR/academic-website-main/$file" ]; then
        echo "  Updating $file"
        rm -rf "$file" 2>/dev/null || true
        cp -r "$TEMP_DIR/academic-website-main/$file" "$file"
    fi
done

# Clean up
rm -rf "$TEMP_DIR"

echo ""
echo -e "${GREEN}✅ Design files updated successfully!${NC}"
echo ""
echo -e "${YELLOW}📋 Next steps:${NC}"
echo "1. Review changes: git diff"
echo "2. Test your site: bundle exec jekyll serve"
echo "3. If everything looks good: git add . && git commit -m 'Update design'"
echo "4. If you want to revert: rm -rf ${DESIGN_FILES[*]} && cp -r .design-backup/* ."
echo ""
echo -e "${BLUE}💡 Your content in vault/ and _config.yml was preserved${NC}"