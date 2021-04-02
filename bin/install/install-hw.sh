#!/usr/bin/env bash
set -euo pipefail

echo "Installing hardware driver packages"
# drivers
yay -S --needed --noconfirm \
    networkmanager \
    pulseaudio \
    bluez \
    libinput-gestures \
