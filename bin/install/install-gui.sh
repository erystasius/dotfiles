#!\usr\bin\env bash
set -euo pipefail

echo "Installing desktop packages"
yay -S --needed --noconfirm \
    bspwm \
    sxhkd \
    picom \
    xterm \
    dmenu \
    polybar \

echo "Installing x packages"
yay -S --needed --noconfirm \
    xclip \
    xtitle \
    xdotool \
    xorg-xprop \
    xorg-xkill \
    xorg-xinput \
    xorg-xsetroot \

echo "Installing input packages"
yay -S --needed --noconfirm \
    fcitx5-im \
    fcitx5-mozc \
    fcitx5-chinese-addons \
    fcitx5-material-color \

echo "Installing gui packages"
yay -S --needed --noconfirm \
    rofi \
    clash \
    jgmenu \
    zenity \
    udiskie \
    redshift \
    nitrogen \
    viewnior \
    alacritty \
    syncthing \
    file-roller \
    pcmanfm-gtk3 \

echo "Installing theme packages"
yay -S --needed --noconfirm \
    deepin-gtk-theme \
    deepin-icon-theme \
    xcursor-breeze \

echo "Installing font packages"
yay -S --needed --noconfirm \
    ttf-dejavu \
    wqy-microhei \
    unicode-emoji \
    noto-fonts-emoji \

echo "Install gui hardware apps"
yay -S --needed --noconfirm \
    gestures \
    pa-applet \
    blueberry \
    pavucontrol \
    network-manager-applet \

echo "Installing multimedia packages"
# yay -S --needed --noconfirm \
    # mcomix \
    # celluloid \

echo "Installing study packages"
# yay -S --needed --noconfirm \
    # anki \
    # goldendict \

echo "Installing show off packages"
# yay -S --needed --noconfirm \
    # gtop \
    # lolcat \
    # figlet \

echo "Installing gui tool packages"
# yay -S --needed --noconfirm \
    # meld \
    # ventoy \
    # deepin-picker \
    # deepin-screenshot \
    # deepin-system-monitor \
