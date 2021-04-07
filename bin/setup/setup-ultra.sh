#!/usr/bin/env bash

# keyboard
echo "Configuring keyboard."
setxkbmap -symbols 'pc+us+inet(evdev)+smoothy(smoothy)'

# touchpad
echo "Configuring touchpad."
xinput set-prop 13 "libinput Tapping Enabled" 1
xinput set-prop 13 "libinput Natural Scrolling Enabled" 1

# xrandr
echo "Configuring monitor."
xrandr --output eDP1 --scale 0.5x0.5

# bspwm
echo "Configuring bspwm."
bspc monitor eDP1 -d I II III IV V VI VII VIII IX X

# polybar 
echo "Configuring polybar."
systemctl --user start polybar@fhd

## Wallpaper
echo "Restoring wallpaper."
nitrogen --restore

echo "Hello ranger, you're good to go now."

