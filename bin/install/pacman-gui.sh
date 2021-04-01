#!/usr/bin/env bash
set -euo pipefail

echo "Installing desktop packages"
yay -S --needed --noconfirm bspwm
yay -S --needed --noconfirm sxhkd
yay -S --needed --noconfirm picom
yay -S --needed --noconfirm xterm
yay -S --needed --noconfirm dmenu
yay -S --needed --noconfirm polybar

echo "Installing x packages"
yay -S --needed --noconfirm xtitle
yay -S --needed --noconfirm xclip
yay -S --needed --noconfirm xorg-xkill
yay -S --needed --noconfirm xorg-xinput
yay -S --needed --noconfirm xorg-xsetroot

echo "Installing input packages"
yay -S --needed --noconfirm fcitx5-im
yay -S --needed --noconfirm fcitx5-material-color

echo "Installing gui packages"
yay -S --needed --noconfirm rofi
yay -S --needed --noconfirm clash
yay -S --needed --noconfirm zenity
yay -S --needed --noconfirm udiskie
yay -S --needed --noconfirm nitrogen
yay -S --needed --noconfirm viewnior
yay -S --needed --noconfirm chromium
yay -S --needed --noconfirm alacritty
yay -S --needed --noconfirm file-roller
yay -S --needed --noconfirm pcmanfm-gtk3
yay -S --needed --noconfirm xfce4-notifyd
yay -S --needed --noconfirm xfce4-settings

echo "Installing theme packages"
yay -S --needed --noconfirm deepin-gtk-theme
yay -S --needed --noconfirm deepin-icon-theme
yay -S --needed --noconfirm xcursor-breeze

echo "Installing font packages"
yay -S --needed --noconfirm ttf-dejavu
yay -S --needed --noconfirm wqy-microhei
yay -S --needed --noconfirm unicode-emoji
yay -S --needed --noconfirm noto-fonts-emoji

echo "Install gui hardware apps"
yay -S --needed --noconfirm blueman
yay -S --needed --noconfirm gestures
yay -S --needed --noconfirm pa-applet
yay -S --needed --noconfirm pavucontrol
yay -S --needed --noconfirm network-manager-applet

echo "Installing multimedia packages"
#yay -S --needed --noconfirm mcomix
#yay -S --needed --noconfirm celluloid

echo "Installing study packages"
#yay -S --needed --noconfirm anki
#yay -S --needed --noconfirm goldendict

echo "Installing show off packages"
#yay -S --needed --noconfirm gtop
#yay -S --needed --noconfirm lolcat
#yay -S --needed --noconfirm figlet

echo "Installing gui tool packages"
#yay -S --needed --noconfirm meld
#yay -S --needed --noconfirm ventoy
#yay -S --needed --noconfirm deepin-picker
#yay -S --needed --noconfirm deepin-screenshot
#yay -S --needed --noconfirm deepin-system-monitor
