#! /usr/bin/env bash

# Get window class under cursor.
wm_class=$(xdotool getmouselocation --shell | grep WINDOW | awk -F '=' '{print $2}' | xargs -I {} xprop -id {} WM_CLASS) 

# Call jgmenu if window class is root or polybar.
if echo $wm_class | grep -q -e root -e polybar; then
    jgmenu_run
fi 
