#!/usr/bin/env bash
cliphist list \
  | rofi -dmenu -theme ~/.config/rofi/cliphist.rasi -i -p "         Cliphist:" \
  | cliphist decode \
  | wl-copy
