echo "Checking pacman mirrors..."
if [[ $(pacman-mirrors -lc) != 'China' ]]; then 
    sudo pacman-mirrors -c China
    echo "Setting China mirrors"
else 
    echo "Pacman is using China mirrors"
fi

echo "Updateing system"
sudo pacman -Syu --noconfirm

echo "Installing yay..."
sudo pacman -S --needed --noconfirm yay

echo "Setting yay mirror..."
yay --aururl "https://aur.tuna.tsinghua.edu.cn" --save


echo "Excluding .xz extension for makepkg to accell aur package installation"
export PKGEXT='.pkg.tar'

echo "Installing packages"
yay -S --needed --noconfirm vim
yay -S --needed --noconfirm emacs
yay -S --needed --noconfirm zsh
yay -S --needed --noconfirm xfce4-terminal
yay -S --needed --noconfirm git
yay -S --needed --noconfirm fcitx-im 
yay -S --needed --noconfirm fcitx-configtool 
yay -S --needed --noconfirm shadowsocks
yay -S --needed --noconfirm aria2
yay -S --needed --noconfirm screenfetch
yay -S --needed --noconfirm lolcat
yay -S --needed --noconfirm anki
yay -S --needed --noconfirm goldendict
yay -S --needed --noconfirm mcomix
yay -S --needed --noconfirm meld

echo "Installing AUR packages"
yay -S --needed --noconfirm cask
yay -S --needed --noconfirm oh-my-zsh-git
yay -S --needed --noconfirm aria2-systemd
yay -S --needed --noconfirm google-chrome
yay -S --needed --noconfirm dropbox

echo "Changing shell to zsh"
if [[ $0 != 'zsh' ]]; then
    chsh -s /usr/bin/zsh
    echo "Default shell changed to zsh"
else
    echo "Default shell is zsh already"
fi

# Manual Stuff
# - Shortcuts
# - Remove xz from makepkg
# - Config apps
#   - Shadowsocks
#   - Chrome
#   - Dropbox
#   - Emacs
#   - Fcitx
# - Xmodmap

