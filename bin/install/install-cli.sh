#!/usr/bin/env bash
set -euo pipefail

echo "Installing shells"
yay -S --needed --noconfirm \
    fish \

echo "Installing editors"
yay -S --needed --noconfirm \
    neovim \
    emacs \

echo "Installing cli packages"
yay -S --needed --noconfirm \
    fd \
    bat \
    git \
    exa \
    zip \
    fzf \
    less \
    wget \
    curl \
    tree \
    htop \
    tldr \
    aria2 \
    unzip \
    procs \
    tokei \
    ripgrep \
    neofetch \
    unarchiver \
    # perf
