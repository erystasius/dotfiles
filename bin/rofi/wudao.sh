#!/usr/bin/env bash
set -euo pipefail

cd /opt/wudao-dict/dict

word=$(cat en.ind | sed "s/|.*$//" | rofi -dmenu -no-custom)

alacritty --hold -e wd $word
