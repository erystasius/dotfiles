echo "Checking pacman mirrors..."
if [[ $(pacman-mirrors -lc) != 'China' ]]; then 
    sudo pacman-mirrors -c China
    echo "Setting China mirrors"
else 
    echo "Pacman is using China mirrors"
fi

echo "Setting pacman color output"
sudo sed -i "s/^#Color$/Color/" /etc/pacman.conf

echo "Updateing system"
sudo pacman -Syu --noconfirm

echo "Installing yay..."
sudo pacman -S --needed --noconfirm yay

echo "Setting yay mirror..."
yay --aururl "https://aur.tuna.tsinghua.edu.cn" --save

echo "Excluding .xz extension for makepkg to accell aur package installation"
export PKGEXT='.pkg.tar'
