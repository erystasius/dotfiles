# Change pacman mirror 
if [[ $(pacman-mirrors -lc) != 'China' ]]; then 
    sudo pacman-mirrors -c China
    echo "set pacman-mirrors -c China"
else 
    echo "pacman contry is China"
fi

# Install yay
sudo pacman -S --needed --noconfirm yay

# Change yay mirror
yay --aururl "https://aur.tuna.tsinghua.edu.cn" --save

# Exclude .xz extension for makepkg to accell aur package installation
export PKGEXT='.pkg.tar'

# Update system
yay -Syu --noconfirm

# Install packages
yay -S --needed --noconfirm vim
yay -S --needed --noconfirm emacs
yay -S --needed --noconfirm cask
yay -S --needed --noconfirm i3-gaps
yay -S --needed --noconfirm compton
yay -S --needed --noconfirm zsh
yay -S --needed --noconfirm xfce4-terminal
yay -S --needed --noconfirm rofi
yay -S --needed --noconfirm git
yay -S --needed --noconfirm polybar
yay -S --needed --noconfirm feh
yay -S --needed --noconfirm fcitx-im 
yay -S --needed --noconfirm fcitx-configtool 
yay -S --needed --noconfirm shadowsocks
yay -S --needed --noconfirm aria2
yay -S --needed --noconfirm screenfetch
yay -S --needed --noconfirm lolcat
yay -S --needed --noconfirm anki
yay -S --needed --noconfirm goldendict
yay -S --needed --noconfirm mcomix
yay -S --needed --noconfirm ranger

# Install AUR packages
yay -S --needed --noconfirm aria2-systemd
yay -S --needed --noconfirm oh-my-zsh-git
yay -S --needed --noconfirm google-chrome
yay -S --needed --noconfirm dropbox
yay -S --needed --noconfirm motrix-bin
yay -S --needed --noconfirm teamviewer
yay -S --needed --noconfirm intellij-idea-ultimate-edition
yay -S --needed --noconfirm xmind
yay -S --needed --noconfirm postman
yay -S --needed --noconfirm nosqlbooster
yay -S --needed --noconfirm wps-office

# Change shell to zsh
if [[ $0 != 'zsh' ]]; then
    chsh -s /usr/bin/zsh
    echo "change default shell to zsh"
else
    echo "default shell is zsh already"
fi

# Autostart i3
if [ ! -f ~/.config/autostart/i3.desktop ]; then
    cp i3.desktop ~/.config/autostart/
    echo "copy i3.desktop"
else 
    echo "i3.desktop already exists"
fi

# Disable xfce desktop stuff
xfconf-query -c xfce4-session -p /sessions/Failsafe/Count -s 1
xfconf-query -c xfce4-session -p /sessions/Failsafe/Client0_Command -s xfsettingsd -t string -a

# Manual Stuff
# - Shortcuts
# - Remove xz from makepkg
# - Config apps
#   - Shadowsocks
#   - Chrome
#   - Dropbox
#   - Emacs
#   - Fcitx
# - Set wallpaper
# - Xmodmap

