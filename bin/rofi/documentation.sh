#!/usr/bin/env bash

cd ~/dotfiles/bin/rofi

cat config/documentation.csv | awk -F , '{print $1}' | rofi -dmenu -no-custom | xargs -I {} rg {} config/documentation.csv | awk -F , '{print $2}' | xargs google-chrome-stable
