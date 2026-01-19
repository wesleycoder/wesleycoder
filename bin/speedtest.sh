#!/usr/bin/env bash

SPEED_TEST_VERSION="1.2.0"
SPEED_TEST_URL="https://install.speedtest.net/app/cli/ookla-speedtest-${SPEED_TEST_VERSION}-macosx-universal.tgz"

if ! command -v speedtest &>/dev/null; then
  echo "speedtest could not be found"

  if ! command -v mise &>/dev/null; then
    echo "mise could not be found"
    exit 1
  fi

  mise use -g "http:speedtest[$SPEED_TEST_VERSION]@1.2.0"
fi

data=$(speedtest -f json)
error_msg=$(echo "$data" | jq -r '.error // empty')

if [ -n "$error_msg" ]; then
  echo "Test failed: $error_msg"
  exit 1
fi

echo "$data" >>speedtest_output.jsonl

read -r time download upload <<<$(
  echo "$data" | LC_ALL=pt_BR.UTF-8 jq -r '
    [
      (.timestamp | fromdate? | strflocaltime("%x %I:%M %p") // "N/A"),
      ((.download.bandwidth // 0) / 125000),
      ((.upload.bandwidth // 0) / 125000)
    ] | @tsv
  '
)

printf "[$time]: Download=%.2f Mbps / Upload=%.2f Mbps\n" "$download" "$upload"
