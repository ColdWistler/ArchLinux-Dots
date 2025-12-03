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

# --- Step 1: Restore Last Wallpaper (Only if the daemon is running) ---
# Check if swww-daemon is running and if the last path file exists
if pgrep -x "swww-daemon" > /dev/null && [ -f "$LAST_WALLPAPER_FILE" ]; then
    LAST_IMAGE=$(cat "$LAST_WALLPAPER_FILE")
    if [ -n "$LAST_IMAGE" ]; then

        # Also re-run matugen on the restored image
        echo "Re-generating color scheme for restored image..."
        matugen image "$LAST_IMAGE" -m "$MATUGEN_MODE"

        exit 0 # Exit the script if we successfully restored the wallpaper on startup
    fi
fi

