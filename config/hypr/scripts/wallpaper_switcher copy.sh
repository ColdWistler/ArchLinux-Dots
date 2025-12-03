#!/bin/bash

# --- Configuration ---
# Directory where your wallpapers are stored
WALLPAPER_DIR="${HOME}/Pictures/Wallpapers"

# File to store the path of the last used wallpaper
LAST_WALLPAPER_FILE="${HOME}/.cache/swww_last_wallpaper"

# Matugen color mode (e.g., dark, light, amoled)
MATUGEN_MODE="dark"

# SWWW transition options (optional, but nice)
TRANSITION_ARGS="--transition-type center --transition-step 30 --transition-fps 60"
# ---------------------


# --- Step 2: Pick and Set a NEW Random Wallpaper (If not restored) ---

# Find a random image (supports jpg and png, adjust as needed)
RANDOM_IMAGE=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.gif" -o -name "*.png" \) | shuf -n 1)

if [ -z "$RANDOM_IMAGE" ]; then
    echo "Error: No wallpaper found in $WALLPAPER_DIR. Exiting."
    exit 1
fi



# 2. Generate the color scheme using matugen
echo "Generating color scheme..."
matugen image "$RANDOM_IMAGE" -m "$MATUGEN_MODE"

# 3. Save the path of the newly set image for the next launch/restore
echo "$RANDOM_IMAGE" > "$LAST_WALLPAPER_FILE"

echo "New wallpaper and color scheme set."
