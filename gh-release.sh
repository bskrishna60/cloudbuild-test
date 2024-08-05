#!/bin/bash

# Variables
TAG_NAME="v2.0.0"
RELEASE_TITLE="Release $TAG_NAME"
RELEASE_NOTES="Release notes for version $TAG_NAME"

# Authenticate with GitHub CLI
echo $GITHUB_TOKEN | gh auth login --with-token

# Verify the authentication
gh auth status

# Navigate to the repository (assuming you have checked out the repo in Cloud Build)
cd /workspace

# Create and push the tag
git tag -a $TAG_NAME -m "Release $TAG_NAME"
git push origin $TAG_NAME

# Create the GitHub release
gh release create $TAG_NAME --title "$RELEASE_TITLE" --notes "$RELEASE_NOTES"
