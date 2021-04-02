#!/usr/bin/env bash
set -euo pipefail

# Dev tools
yay -S --needed --noconfirm base-devel

# Aur packages
yay -S --needed --noconfirm devour
yay -S --needed --noconfirm google-chrome
yay -S --needed --noconfirm oh-my-zsh-git
yay -S --needed --noconfirm wudao-dict-git
