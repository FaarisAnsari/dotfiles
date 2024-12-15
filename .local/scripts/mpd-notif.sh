#!/usr/bin/env sh

# Define the music directory
MUSICDIR="$HOME/Music"

# Temp file for the cover art in /tmp
COVERART=$(mktemp /tmp/cover_XXXXXX.jpg)

# Get the current song details
TITLE=$(mpc --format '%title%' current)
ARTIST=$(mpc --format '%artist%' current)

# Get the full path to the current song
SONG_PATH="$MUSICDIR/$(mpc current -f %file%)"

# Extract the cover art from the playing file
ffmpeg -i "$SONG_PATH" -y -an -vcodec copy "$COVERART" 2>/dev/null

# Send notification with title, artist, and cover art
notify-send -r 27072 "Now Playing" "$TITLE \n$ARTIST" -i "$COVERART"

# Clean up the temp file after sending the notification
rm -f "$COVERART"
