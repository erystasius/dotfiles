#!/usr/bin/env bash

function name-to-desc() {
    pactl list sinks \
        | sed -nE '/(Name|Description)/p' \
        | grep "$1" -A 1 \
        | sed -n 's/.*Description: //p'
}

function desc-to-name() {
    pactl list sinks \
        | sed -nE '/(Name|Description)/p' \
        | grep "$1" -B 1 \
        | sed -n 's/.*Name: //p'
}

function get-default-sink-desc() {
    name=$(pactl info | sed -n 's/Default Sink: //p')
    name-to-desc "$name"
}

if [ "$1" = "desc-to-name" ]; then
    desc-to-name "$2" 
elif [ "$1" = "name-to-desc" ]; then 
    name-to-desc "$2"
elif [ "$1" = "get-default-sink-desc" ]; then 
    get-default-sink-desc
else 
    echo "Unrecognized command: $1"
fi 
