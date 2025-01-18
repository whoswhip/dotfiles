#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
CURRENT_WALLPAPER_FILE="$HOME/.config/hypr/scripts/currentwallpaper.txt"

IMAGES=($(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.bmp" \)))

if [ ${#IMAGES[@]} -eq 0 ]; then
  echo "No images found in $WALLPAPER_DIR"
  exit 1
fi

if [ -f "$CURRENT_WALLPAPER_FILE" ]; then
  CURRENT_WALLPAPER=$(cat "$CURRENT_WALLPAPER_FILE")
else
  CURRENT_WALLPAPER=""
fi

while true; do
  RANDOM_IMAGE="${IMAGES[$RANDOM % ${#IMAGES[@]}]}"
  if [ "$RANDOM_IMAGE" != "$CURRENT_WALLPAPER" ]; then
    break
  fi
done

echo "$RANDOM_IMAGE" > "$CURRENT_WALLPAPER_FILE"

swww img --transition-type grow --transition-pos 0,0 --transition-step 255 --transition-fps 80 "$RANDOM_IMAGE"
