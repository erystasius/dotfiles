#!/usr/bin/env bash
set -euo pipefail

echo ">>>>>>> Add PPAs."
cd /etc/apt/sources.list.d

if ! test -e fish-shell-ubuntu-release-3-focal.list; then
    echo "Add PPA for fish."
    sudo apt-add-repository ppa:fish-shell/release-3
else
    echo "PPA for fish is enabled."
fi

echo ">>>>>>> Installing apt packages."
sudo apt -o Dpkg::options::="--force-overwrite" -y install \
    git \
    vim \
    zip \
    zsh \
    bat \
    fzf \
    fish \
    wget \
    tree \
    curl \
    less \
    htop \
    tldr \
    unzip \
    ripgrep \
    fd-find \
    neofetch \
    net-tools \

echo ">>>>>>> Configuring packages."
sudo ln -s /usr/bin/batcat /usr/bin/bat

echo ">>>>>>> Installing binary packages."
cd /tmp

if ! command -v exa; then
    exa_release=exa-linux-x86_64-musl-v0.10.0
    echo "Installing exa release $exa_release"
    wget https://github.com/ogham/exa/releases/download/v0.10.0/$exa_release.zip
    unzip -o -d exa $exa_release.zip
    sudo cp exa/bin/exa /usr/local/bin
else
    echo "Package exa is already installed."
fi

echo ">>>>>>> Installing dotfiles."
if ! test -d ~/dotfiles; then
    echo "Cloning dotfiles repository."
    git clone https://github.com/erystasius/dotfiles.git ~/dotfiles
else
    echo "Updating existed dotfiles repository."
    cd ~/dotfiles
    git pull
fi

echo "Creating symlinks with dotfiles."
~/dotfiles/install-cli



