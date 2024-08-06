#!/bin/bash

# Variables
TAG_NAME="v2.0.6"
RELEASE_TITLE="Release $TAG_NAME"
RELEASE_NOTES="test version release notes $TAG_NAME"

# Authenticate with GitHub CLI
echo $GITHUB_TOKEN | gh auth login --with-token

# Create and push the tag
git tag -a $TAG_NAME -m "Release $TAG_NAME"
git push origin $TAG_NAME

# Create the GitHub release
gh release create $TAG_NAME --title "$RELEASE_TITLE" --notes "$RELEASE_NOTES"
