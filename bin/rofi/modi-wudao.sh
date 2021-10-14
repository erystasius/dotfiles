#!/usr/bin/env bash
set -euo pipefail

function list-options() {
    cat /opt/wudao-dict/dict/en.ind | sed "s/|.*$//"
}

function do-action() {
    coproc alacritty --hold -e wd "$1"
}

if [ -z "$@" ]; then
    list-options    
else
    do-action "$1"
fi
