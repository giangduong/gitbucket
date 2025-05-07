#!/bin/bash

RELEASE_VERSION=$(date '+%Y%m%d_%H-%M-%S')
TAG_VERSION="v4.38.4.${RELEASE_VERSION}"

gh repo set-default https://github.com/giangduong/gitbucket

gh release create "$TAG_VERSION" ./target/scala-2.13/gitbucket_2.13-4.38.4.war \
  --title "Release $TAG_VERSION" \
  --notes "This is the changelog or description of the release."

