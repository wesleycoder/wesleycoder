#!/usr/bin/env bash
#MISE alias="run"

SIG_FILE="$OUTPUT_DIR/test-1.kill"
SAVE_FILE="$SAVE_DIR/test-1.zip"

test -f "$SIG_FILE" && rm "$SIG_FILE"

get_main_screen_dimensions() {
  local width height res_parts

  if [[ "$OSTYPE" == "darwin"* ]]; then
    res_parts=($(system_profiler -json SPDisplaysDataType |
      jq -r '.SPDisplaysDataType[].spdisplays_ndrvs[] | select(.spdisplays_main == "spdisplays_yes") | ._spdisplays_resolution' |
      grep -oE '[0-9]+'))

    width="${res_parts[0]}"
    height="${res_parts[1]}"
  elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    res=$(xrandr --current | grep '*' | head -n 1 | grep -oE '[0-9]+x[0-9]+')
    width=$(echo "$res" | cut -d'x' -f1)
    height=$(echo "$res" | cut -d'x' -f2)
  else
    width=1024
    height=768
  fi

  echo "$width $height"
}

read -r SCREEN_WIDTH SCREEN_HEIGHT <<<"$(get_main_screen_dimensions)"

HALF_WIDTH=$((SCREEN_WIDTH / 2))

test -f "$SAVE_FILE" || $FACTORIO_BIN --create $SAVE_FILE --map-gen-settings ./map-settings.json

$FACTORIO_BIN \
  --disable-migration-window \
  --window-size "${HALF_WIDTH}x${SCREEN_HEIGHT}" \
  --mod-directory $PROJECT_ROOT \
  --load-game $SAVE_FILE \
  &

FACTORIO_PID=$!

while kill -0 $FACTORIO_PID 2>/dev/null; do
  if [ -f "$SIG_FILE" ]; then
    echo "Signal file detected in $SIG_FILE. Terminating Factorio..."
    kill $FACTORIO_PID
    rm "$SIG_FILE"
    break
  else
    sleep 1
  fi
done

echo "Factorio closed."
