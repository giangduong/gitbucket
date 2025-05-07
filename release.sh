#!/bin/bash
RLVERSION=$(date '+%Y-%m-%d_%H-%M-%S')
ver="v4.38.4.${RLVERSION}"
gh repo set-default https://github.com/giangduong/gitbucket
gh release create $ver ./target/scala-2.13/gitbucket_2.13-4.38.4.war \
  --title "Release $ver" \
  --notes "This is the changelog or description of the release."
