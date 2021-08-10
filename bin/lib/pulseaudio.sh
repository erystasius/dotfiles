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

case "$1" in
    "desc-to-name")             desc-to-name "$2" ;;
    "name-to-desc")             name-to-desc "$2" ;;
    "get-default-sink-desc")    get-default-sink-desc ;;
    *)                          
        echo "Unrecognized command: $1" 
        ;;
esac 
