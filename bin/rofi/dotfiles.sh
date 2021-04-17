#!/usr/bin/env bash
set -euo pipefail

cd ~/dotfiles/config

file=$(fd -t f . | rofi -dmenu -no-custom)

emacsclient -c $file
