#!/usr/bin/env bash

function list-options() {
    pactl list short sinks | cut -f 2
}

function do-action() {
    pactl set-default-sink $1
    pactl list short sink-inputs | cut -f 1 | xargs -I {} pactl move-sink-input {} $1
}

if [ -z "$@" ]; then
    list-options    
else
    do-action $1
fi
