#!/usr/bin/env bash

mode=$(hyprctl get-option input:kb_layout | awk '{print $2}')

printf '{"text":"%s", "tooltip":"Current input mode: %s"}\n' "$mode" "$mode"
