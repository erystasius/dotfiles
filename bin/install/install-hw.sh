#!/usr/bin/env bash
set -euo pipefail

echo "Installing hardware driver packages"
# drivers
yay -S --needed --noconfirm networkmanager
yay -S --needed --noconfirm pulseaudio
yay -S --needed --noconfirm bluez
yay -S --needed --noconfirm libinput-gestures
