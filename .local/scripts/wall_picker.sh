#!/usr/bin/sh

# dependencies: hyprpaper, fzf, a terminal with sixel support

# this is a script to set a wallpaper for hyprpaper on a single monitor setup
# ipc must be turned on inside hyprpaper.conf

bgdir="$HOME/walls/images" # the directory where all wallpapers are stored

# check if sixel is installed, if not -exit
if ! command -v img2sixel &>/dev/null; then
  echo "img2sixel not found."
  exit 1
fi

# use fzf with sixel previews to select wallpaper
bgfile=$(ls "$bgdir" | fzf --height 100% \
  --preview "img2sixel --width 1200 --height auto -q low  $bgdir/{} 2>/dev/null" \
  --preview-window=right:75%:wrap)

#  check if wallpaper was selected, if not - exit.
if [ -z "$bgfile" ]; then
  echo "No wallpaper selected..."
  exit 1
fi

# apply selected wallpaper
wallust.sh "$bgdir"/"$bgfile"
