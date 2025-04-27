#!/bin/bash

options=" Lock\n Sleep\n Reboot\n Shutdown"

choice=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu" \
    -theme-str '
        window {
            width: 8%;
            height: 200px;
            location: center;
        }
        inputbar {
            enabled: false;
        }
    ')

case "$choice" in
    " Lock") hyprlock ;;
    " Sleep") hyprlock & systemctl suspend ;;
    " Reboot") systemctl reboot ;;
    " Shutdown") systemctl poweroff ;;
    *) exit 1 ;;
esac
