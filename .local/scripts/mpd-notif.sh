#!/usr/bin/env sh

music_dir="$HOME/Music"
previewdir="$XDG_STATE_HOME/ncmpcpp/previews"
filename="$(mpc --format "$music_dir"/%file% current)"
previewname="$previewdir/$(mpc --format %album% current | base64).png"

[ -e "$previewname" ] || ffmpeg -y -i "$filename" -an -vf scale=96:96 "$previewname" > /dev/null 2>&1

notify-send -r 27072 -a "mpd" "Now Playing" "$(mpc --format '%title%\n%artist%' current)" -i "$previewname"
