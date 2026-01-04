#!/bin/bash

# Path to your keybindings file
KEYBINDINGS_FILE="$HOME/.config/hypr/keybindings.txt"

# Check if the keybindings file exists
if [ ! -f "$KEYBINDINGS_FILE" ]; then
  notify-send "Keybindings file not found!" "$KEYBINDINGS_FILE does not exist."
  exit 1
fi

# Show keybindings using rofi with a custom theme
rofi \
  -modi "keybindings:cat $KEYBINDINGS_FILE" \
  -show keybindings \
  -theme ~/.config/rofi/themes/keybindings-theme.rasi
