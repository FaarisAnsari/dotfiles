#!/usr/bin/env sh

if [ -z "$1" ]; then
	echo "add wallpaper as arg"
	exit 1
fi

wallust run "$1" &

hyprctl hyprpaper reload ,"$1"

# while wallust is still running, wait
while pgrep -x wallust >/dev/null; do
	sleep 0.5
done

# Restart dunst and update pywalfox
pkill dunst &
pywalfox --browser librewolf update
