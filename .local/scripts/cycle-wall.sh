#!/usr/bin/env sh

WALLPAPER_DIR="$HOME/walls/images/"
INDEX_FILE="/tmp/wallust-index"

# Create index file if it doesn't exist, defaulting to -1
[ ! -f "$INDEX_FILE" ] && echo -1 > "$INDEX_FILE"

# Read the current index
CURRENT_INDEX=$(cat "$INDEX_FILE")

# Generate a list of wallpapers
IMAGES=$(find "$WALLPAPER_DIR" -type f | sort)
IMAGE_COUNT=$(echo "$IMAGES" | wc -l)

# Exit if no images are found
[ "$IMAGE_COUNT" -eq 0 ] && exit 1

# Calculate the next index
NEXT_INDEX=$(( (CURRENT_INDEX + 1) % IMAGE_COUNT ))

# Get the wallpaper corresponding to the next index
WALLPAPER=$(echo "$IMAGES" | sed -n "$((NEXT_INDEX + 1))p")

# Save the updated index
echo "$NEXT_INDEX" > "$INDEX_FILE"

# Apply the new wallpaper
wallust.sh "$WALLPAPER"
