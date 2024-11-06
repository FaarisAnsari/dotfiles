#!/bin/bash

music_dir="$HOME/Music"
previewdir="${XDG_CONFIG_HOME:-$HOME/.config}/ncmpcpp/previews"
filename="${music_dir}/$(mpc --format '%file%' current)"
previewname="$previewdir/$(mpc --format '%album%' current | base64).png"

# Ensure preview directory exists
mkdir -p "$previewdir"

# Check for cover image files
cover_image_found=false
for ext in jpg jpeg png; do
    if [[ -f "$(dirname "$filename")/cover.$ext" ]]; then
        cp "$(dirname "$filename")/cover.$ext" "$previewname"
        cover_image_found=true
        break
    fi
done

# Extract cover art from audio file only if no cover image is found
if ! $cover_image_found; then
    ffmpeg -y -i "$filename" -map 0:v -vf scale=128:128 "$previewname" -loglevel error
fi

# Notify with the cover art
notify-send -r 27072 "Now Playing" "$(mpc --format '%title% \n%artist%' current)" -i "$previewname"
