#!/usr/bin/env bash

function list-options() {
    pactl list short sinks | cut -f 2 | ~/.local/bin/lib/pulseaudio.sh name-to-desc
}

function do-action() {
    sink=$(~/.local/bin/lib/pulseaudio.sh desc-to-name "$1")
    pactl set-default-sink "$sink"
    pactl list short sink-inputs | cut -f 1 | xargs -I {} pactl move-sink-input {} "$sink"
}

if [ -z "$@" ]; then
    list-options    
else
    do-action "$1"
fi
