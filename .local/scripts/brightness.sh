#!/usr/bin/env sh

# Function to send brightness change notification
notification() {
    # Get current brightness level
		brightness="$(xbacklight -get)"
    # Send notification about the brightness change
    dunstify -a "brightness" -u low -r "9999" -t 2000 -h int:value:"$brightness" -i "notification-display-brightness" "Brightness" "${brightness}%"
}

# Main script logic
case $1 in
    help)
        show_help
        exit 0
        ;;
    up)
        # Increase brightness by the specified increment value
        xbacklight -inc "$2"
        ;;
    down)
        # Decrease brightness by the specified increment value
        xbacklight -dec "$2"
        ;;
    *)
        exit 1
        ;;
esac

# Send notification after adjusting brightness
notification
exit 0
