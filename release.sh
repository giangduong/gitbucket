#!/bin/bash

set -e

TARGET_BRANCH="v4.38.4"
RELEASE_VERSION=$(date '+%Y%m%d_%H-%M-%S')
TAG_VERSION="v4.38.4.${RELEASE_VERSION}"
WAR_FILE="./target/scala-2.13/gitbucket_2.13-4.38.4.war"

# Check prerequisites

if [ ! -f "$WAR_FILE" ]; then
  echo "WAR file not found at $WAR_FILE"
  exit 1
fi

# Set default repo
gh repo set-default https://github.com/giangduong/gitbucket

# Fetch the latest commit hash from the target branch
COMMIT_SHA=$(git rev-parse origin/$TARGET_BRANCH)

# Create a tag pointing to that commit
git tag "$TAG_VERSION" "$COMMIT_SHA"
#git push origin "$TAG_VERSION"

# Create GitHub release
gh release create "$TAG_VERSION" "$WAR_FILE" \
  --title "Release $TAG_VERSION" \
  --notes "This is the changelog or description of the release."
