#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Screenshot to FileGarden
# @raycast.mode silent
# @raycast.packageName FileGarden
# @raycast.icon 📸

# @raycast.preference.text userId "User ID"
# @raycast.preference.password cookie "FileGarden Cookie"

# @raycast.description Capture a screenshot, upload to FileGarden and copy the url to clipboard
# @raycast.author wesleycoder
# @raycast.authorURL https://raycast.com/wesleycoder

COOKIE="auth=s%3ANjlkZDI4MTUzNTQzOGMzMDQ5ZjhjOTk4OjdEZ3prZm14TmNGVzR4NUxvMS8xT2xUaEVkdTBXQTBETzhGUHFhRGhMWk52SmcrUEc1M1lXbHROaWJxcmxkalRVRUxJV3B5aThKenNKVDNVZGFqdmZLeUgxYjZubXNBa2hmN0l5UHpOM3ozSllnUzZEcTFDaTJSUk4zU3E1eXJzTDg0RHZ3PT0%3D.LDrhOeAPNlOCpfzrK83jsUUdOwr99l4P5Ef8KBamiQE"
USER_ID="69dd281535438c3049f8c998"
SHORT_ID=$(echo -n "$USER_ID" | xxd -r -p | base64 | tr '+/' '-_' | tr -d '\n')
PARENT_ID="aeY122Znzh9JkLMH"

DATE_TIME=$(date -u +"%FT%TZ")
TMP_FILE="/tmp/screenshot_$DATE_TIME.png"

screencapture -i "$TMP_FILE"

if [ ! -f "$TMP_FILE" ]; then
  echo "Screenshot cancelled."
  exit 0
fi

RESPONSE=$(
  curl -s -X 'POST' "https://api.filegarden.com/users/$USER_ID/pipe" \
    -H "cookie: $COOKIE" \
    -H 'content-type: application/octet-stream' \
    -H 'origin: https://filegarden.com' \
    -H 'referer: https://filegarden.com/' \
    -H "x-data: %7B%22parent%22:%22$PARENT_ID%22,%22name%22:%22screenshot_$DATE_TIME.png%22%7D" \
    --data-binary "@$TMP_FILE"
)

echo "RESPONSE:" $RESPONSE

# 3. Parse the JSON response to get the file path
# Based on FileGarden's structure, it usually returns an array of items.
FILE_PATH=$(echo "$RESPONSE" | jq -r '.path')

if [ "$FILE_PATH" != "null" ] && [ -n "$FILE_PATH" ]; then
  FINAL_URL="https://file.garden/$SHORT_ID/$FILE_PATH"

  # 5. Copy the final URL to the clipboard
  echo -n "$FINAL_URL" | pbcopy
  echo "Uploaded & Copied: $FINAL_URL"
else
  echo "Upload failed. Check your Cookie."
fi

# 6. Cleanup the temporary image file
rm "$TMP_FILE"
