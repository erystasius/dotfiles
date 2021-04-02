#!/usr/bin/env bash

# xrandr
xrandr --output eDP1 --scale 0.5x0.5
nitrogen --restore

# polybar 
pkill polybar
nohup polybar -r fhd 2>&1 >/dev/null &

# picom
pkill picom
nohup picom 2>&1 >/dev/null &

# bspwm
bspc monitor eDP1 -d I II III IV V VI VII VIII IX X

# keyboard
setxkbmap -symbols 'pc+us+inet(evdev)+smoothy(smoothy)'

# touchpad
xinput set-prop 13 "libinput Tapping Enabled" 1
xinput set-prop 13 "libinput Natural Scrolling Enabled" 1
