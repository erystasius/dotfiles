#!/usr/bin/env bash
set -euo pipefail

function list-options() {
    fd --type file --exclude dotbot . ~/dotfiles
}

function do-action() {
    emacsclient --create-frame --no-wait "$1"
}

if [ -z "$@" ]; then
    list-options    
else
    do-action "$1"
fi
