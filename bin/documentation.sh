#!/usr/bin/env bash

cat documentation.csv | awk -F , '{print $1}' | rofi -dmenu -no-custom | xargs -I {} rg {} documentation.csv | awk -F , '{print $2}' | xargs google-chrome-stable
