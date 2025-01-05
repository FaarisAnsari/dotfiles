# execute Hyprland when in TTY1 only
if uwsm check may-start; then
	exec uwsm start hyprland-uwsm.desktop
fi
