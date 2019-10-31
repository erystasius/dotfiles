#!/bin/sh
bspc subscribe desktop_layout | \
while read -r line
do
    if [[ $line == *"monocle"* ]]; then
        polybar test &
    else
        pkill -f polybar\ test
    fi
done
