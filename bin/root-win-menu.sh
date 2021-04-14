#! /usr/bin/env bash

wm_class=$(xdotool getmouselocation --shell | grep WINDOW | awk -F '=' '{print $2}' | xargs -I {} xprop -id {} WM_CLASS) 


if echo $wm_class | grep -q root; then
    jgmenu_run
fi 
