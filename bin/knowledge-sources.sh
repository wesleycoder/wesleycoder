#!/usr/bin/env bash
# Fetches urls listed on ./sources.txt converts them to markdown and saves them to ./.sources/*.md

while IFS= read -r url; do
  domain="${url#*://}"
  domain="${domain%%/*}"
  domain="${domain%%:*}"
  domain="${domain#*@}"

  path="${url#*://*/}"
  path="${path%/*}"
  path="${path%%\?*}"

  filename="${url##*/}"
  filename="${filename%%\?*}"
  filename="${filename%.*}"
  filename="${filename:-index}"

  mkdir -p ".sources/$domain/$path"

  if [[ "$(echo "$url" | tr '[:upper:]' '[:lower:]')" == *.txt ]]; then
    curl -sSL "$url" >".sources/$domain/$path/$filename.txt" &
  else
    curl -sSL "$url" | html2markdown >".sources/$domain/$path/$filename.md" &
  fi
done <sources.txt

wait
