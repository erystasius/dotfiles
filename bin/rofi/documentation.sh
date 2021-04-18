#!/usr/bin/env bash
set -euo pipefail

cd ~/dotfiles/bin/rofi

link=$(cat config/documentation.csv \
    | cut -d , -f 1 \
    | rofi -dmenu -no-custom \
    | xargs -I {} rg {} config/documentation.csv \
    | cut -d , -f 2)

google-chrome-stable $link

