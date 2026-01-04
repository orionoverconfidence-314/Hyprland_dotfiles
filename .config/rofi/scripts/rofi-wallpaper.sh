#!/usr/bin/env bash

# Where your wallpapers live:
WALLPAPER_DIR="$HOME/Pictures/wallpaper"

# Where we store the last-used index (if you ever need it):
INDEX_FILE="$HOME/.cache/last_wall_index"

# The Rofi snippet file we’ll regenerate:
ROFI_THEME_SNIPPET="/home/orion_siva/.config/rofi/scripts/wallpaper_rofi.h"

# 1) Gather all supported images into an array:
mapfile -t files < <(find "$WALLPAPER_DIR" -maxdepth 1 -type f \
  \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' \
   -o -iname '*.webp' -o -iname '*.bmp' -o -iname '*.gif' \
   -o -iname '*.tiff' -o -iname '*.pnm' -o -iname '*.tga' \))

# 2) Build Rofi dmenu input with thumbnails:
rofi_input=""
for img in "${files[@]}"; do
  name="$(basename "$img")"
  rofi_input+="${name}\0icon\x1fthumbnail://${img}\n"
done

# 3) Launch Rofi:
choice=$(echo -en "$rofi_input" | \
  rofi -no-config \
       -theme wallpaper.rasi \
       -dmenu -i -p "  Wallpaper:" \
       -show-icons)

# 4) If the user made a choice, apply it & update both cache + Rofi snippet:
if [[ -n "$choice" ]]; then
  # Find the full path corresponding to the basename
  for img in "${files[@]}"; do
    if [[ "$(basename "$img")" == "$choice" ]]; then
      selected="$img"
      break
    fi
  done

  # a) Set the wallpaper
  swww img --transition-fps 60 --transition-type wipe --transition-duration 2 "$selected"

  # b) Save to your “last_wall_index” if you need it elsewhere
  echo "$selected" > "$INDEX_FILE"

  # c) Regenerate the Rofi‐theme snippet so its window { background-image } is updated
  cat > "$ROFI_THEME_SNIPPET" <<EOF
#include <string>

std::string wallroficpp() {
    static const std::string wallpaper_url = "$selected";
    return wallpaper_url;
}
EOF

# Update Rofi theme snippet
cat > "/home/orion_siva/.config/waybar/scripts/wallpaper_scripts/wallpaper.h" <<EOF
#include <string>

std::string wallcpp() {
    static const std::string wallpaper_url = "$selected";
    return wallpaper_url;
}
EOF
fi

# 5) If no choice (Esc), do nothing and exit.

pkill waybar
g++ "/home/orion_siva/.config/waybar/scripts/wallpaper_scripts/change_theme.cpp" -o "/home/orion_siva/.config/waybar/scripts/wallpaper_scripts/change_theme"
"/home/orion_siva/.config/waybar/scripts/wallpaper_scripts/change_theme"
waybar &

g++ /home/orion_siva/.config/rofi/scripts/wallpaper_rofi.cpp -o /home/orion_siva/.config/rofi/scripts/wallpaper_rofi&& /home/orion_siva/.config/rofi/scripts/wallpaper_rofi