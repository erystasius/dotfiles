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
yay -S --needed --noconfirm zsh
yay -S --needed --noconfirm xfce4-terminal
yay -S --needed --noconfirm git
yay -S --needed --noconfirm neofetch

echo "Installing AUR packages"
yay -S --needed --noconfirm ulauncher
yay -S --needed --noconfirm oh-my-zsh-git
yay -S --needed --noconfirm google-chrome

echo "Changing shell to zsh"
if [[ $0 != 'zsh' ]]; then
    chsh -s /usr/bin/zsh
    echo "Default shell changed to zsh"
else
    echo "Default shell is zsh already"
fi

