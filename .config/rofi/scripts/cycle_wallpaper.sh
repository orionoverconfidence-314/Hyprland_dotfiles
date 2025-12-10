#!/usr/bin/env bash

# Directory containing wallpapers
WALLPAPER_DIR="$HOME/Pictures/wallpaper"
INDEX_FILE="$HOME/.cache/last_wall_index"
ROFI_THEME_SNIPPET="/home/orion_siva/.config/rofi/scripts/wallpaper_rofi.h"

# Collect files
mapfile -t files < <(find "$WALLPAPER_DIR" -maxdepth 1 -type f \
  \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' \
   -o -iname '*.webp' -o -iname '*.bmp' -o -iname '*.gif' \
   -o -iname '*.tiff' -o -iname '*.pnm' -o -iname '*.tga' \))

(( ${#files[@]} )) || exit 1

# Read last index
if [[ -r "$INDEX_FILE" ]]; then
  read -r last_index < "$INDEX_FILE"
else
  last_index=-1
fi

# Next index (wrap around)
next_index=$(( (last_index + 1) % ${#files[@]} ))
wallpath="${files[next_index]}"

# Apply wallpaper with swww
swww img --transition-fps 60 --transition-type random --transition-duration 1 "$wallpath"

# Update Rofi theme snippet
cat > "$ROFI_THEME_SNIPPET" <<EOF
#include <string>

std::string wallroficpp() {
    static const std::string wallpaper_url = "$wallpath";
    return wallpaper_url;
}
EOF

# Update Rofi theme snippet
cat > "/home/orion_siva/.config/waybar/scripts/wallpaper_scripts/wallpaper.h" <<EOF
#include <string>

std::string wallcpp() {
    static const std::string wallpaper_url = "$wallpath";
    return wallpaper_url;
}
EOF

# Persist index
echo "$next_index" > "$INDEX_FILE"

pkill waybar
g++ "/home/orion_siva/.config/waybar/scripts/wallpaper_scripts/change_theme.cpp" -o "/home/orion_siva/.config/waybar/scripts/wallpaper_scripts/change_theme"
"/home/orion_siva/.config/waybar/scripts/wallpaper_scripts/change_theme"
waybar &

g++ /home/orion_siva/.config/rofi/scripts/wallpaper_rofi.cpp -o /home/orion_siva/.config/rofi/scripts/wallpaper_rofi&& /home/orion_siva/.config/rofi/scripts/wallpaper_rofi