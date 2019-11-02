#!/bin/sh
bspc subscribe desktop_layout | \
while read -r line
do
    if [[ $line == *"monocle"* ]]; then
        polybar bsptab &
    else
        pkill -f polybar\ bsptab
    fi
done
