#!/usr/bin/env bash
set -euo pipefail

cd ~/dotfiles

file=$(fd --type file --exclude dotbot . | rofi -dmenu -no-custom)

emacsclient -c $file
