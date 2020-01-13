echo "Checking pacman mirrors..."
if [[ $(pacman-mirrors -lc) != 'China' ]]; then 
    sudo pacman-mirrors -c China
    echo "Setting China mirrors"
else 
    echo "Pacman is using China mirrors"
fi

echo "Setting pacman color output"
sudo set -i "s/^#Color$/Color/" /etc/pacman.conf

echo "Updateing system"
sudo pacman -Syu --noconfirm

echo "Installing yay..."
sudo pacman -S --needed --noconfirm yay

echo "Setting yay mirror..."
yay --aururl "https://aur.tuna.tsinghua.edu.cn" --save

echo "Excluding .xz extension for makepkg to accell aur package installation"
export PKGEXT='.pkg.tar'

echo "Installing hardware packages"
# network
yay -S --needed --noconfirm networkmanager
yay -S --needed --noconfirm network-manager-applet
yay -S --needed --noconfirm gnome-keyring
# audio
yay -S --needed --noconfirm pulseaudio
yay -S --needed --noconfirm pavucontrol
yay -S --needed --noconfirm pa-applet
# bluetooth
yay -S --needed --noconfirm bluez
yay -S --needed --noconfirm rfkill
yay -S --needed --noconfirm blueberry
# trackpad
yay -S --needed --noconfirm libinput-gestures
yay -S --needed --noconfirm gestures

echo "Installing packages"
yay -S --needed --noconfirm fd
yay -S --needed --noconfirm zsh
yay -S --needed --noconfirm git
yay -S --needed --noconfirm gvim
yay -S --needed --noconfirm rofi
yay -S --needed --noconfirm tree
yay -S --needed --noconfirm htop
yay -S --needed --noconfirm dmenu
yay -S --needed --noconfirm bspwm
yay -S --needed --noconfirm sxhkd
yay -S --needed --noconfirm dmenu
yay -S --needed --noconfirm udiskie
yay -S --needed --noconfirm polybar
yay -S --needed --noconfirm compton
yay -S --needed --noconfirm firefox
yay -S --needed --noconfirm nitrogen
yay -S --needed --noconfirm viewnior
yay -S --needed --noconfirm pcmanfm-gtk3
yay -S --needed --noconfirm xfce4-notifyd
yay -S --needed --noconfirm xfce4-terminal
yay -S --needed --noconfirm xfce4-settings

# X
yay -S --needed --noconfirm xtitle

# Network
yay -S --needed --noconfirm nmap
yay -S --needed --noconfirm v2ray
yay -S --needed --noconfirm shadowsocks

# Fcitx
yay -S --needed --noconfirm fcitx-im
yay -S --needed --noconfirm fcitx-configtool

# Archive
yay -S --needed --noconfirm zip
yay -S --needed --noconfirm unzip
yay -S --needed --noconfirm unarchiver
yay -S --needed --noconfirm file-roller

# Font
yay -S --needed --noconfirm ttf-dejavu
yay -S --needed --noconfirm wqy-microhei
yay -S --needed --noconfirm unicode-emoji
yay -S --needed --noconfirm noto-fonts-emoji

# GTK/Icon/Cursor Theme
yay -S --needed --noconfirm deepin-gtk-theme
yay -S --needed --noconfirm deepin-icon-theme
yay -S --needed --noconfirm xcursor-breeze

# Theming
xfconf-query -c xsettings -p /Net/ThemeName -s "deepin"
xfconf-query -c xsettings -p /Net/IconThemeName -s "deepin"
xfconf-query -c xsettings -p /Gtk/CursorThemeName -s "xcursor-breeze"

echo "Changing shell to zsh"
if [[ $SHELL != '/usr/bin/zsh' ]]; then
    chsh -s /usr/bin/zsh
    echo "Default shell changed to zsh"
else
    echo "Default shell is zsh already"
fi

