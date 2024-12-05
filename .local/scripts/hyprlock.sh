#!/usr/bin/env sh

cp $(hyprctl hyprpaper listloaded) /tmp/wallpaper
hyprlock
