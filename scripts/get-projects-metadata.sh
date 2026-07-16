#!/usr/bin/env bash

out_dir="$1"
shift
mkdir -p "$out_dir"

for repository; do
  curl --fail --silent --show-error \
    -H "Accept: application/vnd.github+json" \
    "https://api.github.com/repos/$repository" |
    jq '.' >"$out_dir/${repository//\//_}.json"
done
