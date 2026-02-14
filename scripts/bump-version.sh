#!/bin/bash

# Version Bump Script for Trauso
# Usage: ./bump-version.sh <new-version>
# Example: ./bump-version.sh 1.0.3

if [ $# -eq 0 ]; then
    echo "Error: No version specified"
    echo "Usage: $0 <new-version>"
    echo "Example: $0 1.0.3"
    exit 1
fi

NEW_VERSION=$1

# Validate version format (basic check)
if [[ ! $NEW_VERSION =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "Error: Invalid version format. Use semantic versioning (e.g., 1.0.3)"
    exit 1
fi

echo "Updating version to $NEW_VERSION..."

# Update package.json
sed -i.bak "s/\"version\": \"[^\"]*\"/\"version\": \"$NEW_VERSION\"/" package.json
echo "✓ Updated package.json"

# Update src-tauri/tauri.conf.json
sed -i.bak "s/\"version\": \"[^\"]*\"/\"version\": \"$NEW_VERSION\"/" src-tauri/tauri.conf.json
echo "✓ Updated src-tauri/tauri.conf.json"

# Update src-tauri/Cargo.toml
sed -i.bak "s/^version = \"[^\"]*\"/version = \"$NEW_VERSION\"/" src-tauri/Cargo.toml
echo "✓ Updated src-tauri/Cargo.toml"

# Remove backup files
rm -f package.json.bak src-tauri/tauri.conf.json.bak src-tauri/Cargo.toml.bak

# Update Cargo.lock
cd src-tauri && cargo update -p trauso && cd ..
echo "✓ Updated Cargo.lock"

echo ""
echo "Version bumped to $NEW_VERSION!"
echo ""
echo "Next steps:"
echo "1. Review changes: git diff"
echo "2. Commit changes: git add . && git commit -m \"Bump version to $NEW_VERSION\""
echo "3. Create tag: git tag v$NEW_VERSION"
echo "4. Push changes: git push && git push --tags"
echo ""
echo "The GitHub Actions workflow will automatically create a release when the tag is pushed."
