#!/usr/bin/env bash
set -euo pipefail

echo ">>>>>>> System update."
yum update -y

echo ">>>>>>> Add repos."
yum install -y epel-release
yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
yum-config-manager --add-repo=https://download.opensuse.org/repositories/shells:fish:release:3/CentOS_7/shells:fish:release:3.repo
yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/konimex/neofetch/repo/epel-7/konimex-neofetch-epel-7.repo

echo ">>>>>>> Installing yum packages."
yum install -y \
    git \
    vim \
    zip \
    zsh \
    fish \
    wget \
    tree \
    curl \
    less \
    htop \
    tldr \
    unzip \
    ripgrep \
    neofetch \
    net-tools \

echo ">>>>>>> Installing binary packages."

cd /tmp

fd_release=fd-v8.2.1-x86_64-unknown-linux-musl
wget https://github.com/sharkdp/fd/releases/download/v8.2.1/$fd_release.tar.gz
tar xzvf $fd_release.tar.gz
cp $fd_release/fd /usr/local/bin

bat_release=bat-v0.18.0-x86_64-unknown-linux-musl
wget https://github.com/sharkdp/bat/releases/download/v0.18.0/$bat_release.tar.gz
tar xzvf $bat_release.tar.gz
cp $bat_release/bat /usr/local/bin

exa_release=exa-linux-x86_64-musl-v0.10.0
wget https://github.com/ogham/exa/releases/download/v0.10.0/$exa_release.zip
unzip -o -d exa $exa_release.zip
cp exa/bin/exa /usr/local/bin

fzf_release=fzf-0.27.0-linux_amd64
wget https://github.com/junegunn/fzf/releases/download/0.27.0/$fzf_release.tar.gz
tar xzvf $fzf_release.tar.gz
cp fzf /usr/local/bin

# todo
# sync bash / fish / git / vim config file
git clone https://github.com/erystasius/dotfiles.git ~/dotfiles
sh ~/dotfiles/install-cli
