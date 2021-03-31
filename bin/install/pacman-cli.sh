#!/usr/bin/env bash
set -euo pipefail

echo "Installing shells"
yay -S --needed --noconfirm zsh
yay -S --needed --noconfirm fish

echo "Installing editors"
yay -S --needed --noconfirm gvim
yay -S --needed --noconfirm emacs

echo "Installing cli packages"
yay -S --needed --noconfirm fd
yay -S --needed --noconfirm bat
yay -S --needed --noconfirm git
yay -S --needed --noconfirm exa
yay -S --needed --noconfirm zip
yay -S --needed --noconfirm wget
yay -S --needed --noconfirm curl
yay -S --needed --noconfirm tree
yay -S --needed --noconfirm htop
yay -S --needed --noconfirm aria2
yay -S --needed --noconfirm unzip
yay -S --needed --noconfirm procs
yay -S --needed --noconfirm tokei
yay -S --needed --noconfirm neofetch
yay -S --needed --noconfirm unarchiver
#yay -S --needed --noconfirm perf
