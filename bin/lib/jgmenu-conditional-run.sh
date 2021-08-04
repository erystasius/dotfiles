#! /usr/bin/env bash

# Get window class under cursor.
function get-wm-class-under-cursor() {
    xdotool getmouselocation --shell \
        | grep WINDOW \
        | awk -F '=' '{print $2}' \
        | xargs -I {} xprop -id {} WM_CLASS 
}

# Call jgmenu if window class is root or polybar.

if get-wm-class-under-cursor | grep -q -e root -e polybar; then
    jgmenu_run
fi 
