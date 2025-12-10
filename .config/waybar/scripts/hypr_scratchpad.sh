#!/usr/bin/env bash

count=$(hyprctl clients -j | jq '[.[] | select(.workspace.id == -99)] | length')

class="none"
if [[ "$count" -eq 1 ]]; then
  class="one"
elif [[ "$count" -gt 1 ]]; then
  class="many"
fi

printf '{"text":"%s", "class":"%s", "alt":"%s", "tooltip":"%s"}\n' "$count" "$class" "$class" "$count"
