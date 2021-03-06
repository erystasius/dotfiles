#!/usr/bin/env bash
set -euo pipefail

echo "Installing dev tools"
yay -S --needed --noconfirm \
    base-devel \

echo "Installing aur packages"
yay -S --needed --noconfirm \
    devour \
    google-chrome \
    wudao-dict-git \
    ariang-allinone \
