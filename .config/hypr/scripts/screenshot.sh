#!/usr/bin/env bash
set -euo pipefail

## Screenshot & Recording Menu for Hyprland
## Original: adi1090x
## Improved for Hyprland + hyprcap

########################
### CONFIGURATION ######
########################

SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
RECORD_DIR="$HOME/Videos/ScreenRecords"

DATE="$(date +'%Y-%m-%d_%H-%M-%S')"


efonts="JetBrains Mono Nerd Font Propo 25"

########################
### NOTIFICATIONS ######
########################

notify() {
  notify-send -e \
    -h string:x-canonical-private-synchronous:osd \
    "$1" "$2"
}

countdown() {
  local title="$1"
  local seconds="$2"

  for ((i=seconds; i>0; i--)); do
    notify "$title" "Starting in ${i}s…"
    sleep 1
  done
}

########################
### ROFI MENU ##########
########################


prompt="Screenshot"
mesg="DIR: $SCREENSHOT_DIR"

option_now=""     # Screenshot (monitor)
option_area=""    # Area
option_win=""     # Window
option_delay=""   # Delayed
option_record=""  # Record

rofi_cmd() {
  rofi -dmenu \
    -p "$prompt" \
    -mesg "$mesg" \
    -markup-rows \
    -theme screenshot.rasi \
    -theme-str "window { width: 120px; }" \
    -theme-str "listview { columns: 1; lines: 5; }" \
    -theme-str 'textbox-prompt-colon { str: ""; }' \
    -theme-str "element-text {font: \"$efonts\";}" 
}

chosen="$(printf "%s\n" \
  "$option_now" \
  "$option_area" \
  "$option_win" \
  "$option_delay" \
  "$option_record" | rofi_cmd)"

########################
### SCREENSHOTS ########
########################

shot_monitor() {
  sleep 0.2
  hyprcap shot monitor:active \
    -c \
    -z \
    -o "$SCREENSHOT_DIR" \
    -f "${DATE}_monitor.png"
}

shot_window() {
  sleep 0.2
  hyprcap shot window \
    -c \
    -o "$SCREENSHOT_DIR" \
    -f "${DATE}_window.png"
}

shot_delayed() {
  sleep 0.2
  countdown "Screenshot" 5
  swaync-client --close-latest

  hyprcap shot monitor:active \
    -c \
    -o "$SCREENSHOT_DIR" \
    -f "${DATE}_monitor.png"
}

shot_area () {
# Pick region
GEOM=$(slurp)

# Exit if cancelled
[ -z "$GEOM" ] && exit 1

# Extract width and height
SIZE=$(echo "$GEOM" | awk '{print $2}')
WIDTH=${SIZE%x*}
HEIGHT=${SIZE#*x}

# Output directory
DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"


# Filename
FILE="$(date +%Y-%m-%d_%H-%M-%S)_${WIDTH}x${HEIGHT}.png"

PATH_FILE="$DIR/$FILE"


# Take screenshot
grim -g "$GEOM" - | tee "$DIR/$FILE" | wl-copy

notify-send \
  -i "$PATH_FILE" \
  "Screenshot saved & copied" \
  "$FILE"

}

########################
### RECORDING ##########
########################

RECORD_PID_FILE="/tmp/hyprcap_record.pid"

toggle_record() {
  # ── STOP RECORDING ─────────────────────────────
  if [[ -f "$RECORD_PID_FILE" ]] && kill -0 "$(cat "$RECORD_PID_FILE")" 2>/dev/null; then
    kill -SIGINT "$(cat "$RECORD_PID_FILE")"
    rm -f "$RECORD_PID_FILE"

    notify "Screen recording" "Stopped"
    swaync-client --close-latest
    return
  fi

  # ── START RECORDING ────────────────────────────
  swaync-client --close-latest

  hyprcap record \
    -d 5 \
    -o "$RECORD_DIR" \
    -f "${DATE}_recording.mp4" \
    -s 

  echo $! > "$RECORD_PID_FILE"

  notify "Screen recording" "Started"
}


########################
### ACTION DISPATCH ####
########################

case "$chosen" in
  "$option_now")    shot_monitor ;;
  "$option_area")  shot_area ;;
  "$option_win")   shot_window ;;
  "$option_delay") shot_delayed ;;
  "$option_record") toggle_record ;;
esac
