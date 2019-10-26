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
yay -S --needed --noconfirm zsh
yay -S --needed --noconfirm git
yay -S --needed --noconfirm gvim
yay -S --needed --noconfirm rofi
yay -S --needed --noconfirm dmenu
yay -S --needed --noconfirm pcmanfm
yay -S --needed --noconfirm firefox
yay -S --needed --noconfirm xfce4-notifyd
yay -S --needed --noconfirm xfce4-terminal
yay -S --needed --noconfirm xfce4-settings

echo "Changing shell to zsh"
if [[ $SHELL != '/usr/bin/zsh' ]]; then
    chsh -s /usr/bin/zsh
    echo "Default shell changed to zsh"
else
    echo "Default shell is zsh already"
fi

