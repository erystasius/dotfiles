alias ls="ls --color=always"
alias la="ls -A"
alias ll="ls -ahlF"
alias lg="ll | grep"
alias df="df -h"
alias du="du -h -d 1"
alias hg="history | grep"
alias pg="ps aux | grep"
alias grep="grep --color=auto"

alias g="git"
alias v="gvim"
alias o="xdg-open"

HISTCONTROL=ignoredups:erasedups
HISTSIZE=1000
HISTFILESIZE=1000

export PS1="\[$(tput bold)\][\[$(tput sgr0)\]\[\033[38;5;107m\]\A\[$(tput sgr0)\]\[\033[38;5;15m\]] \[$(tput sgr0)\]\[\033[38;5;220m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;9m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;69m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\] \\$ \[$(tput sgr0)\]"

eval $(thefuck --alias)

echo 1 | sudo tee /sys/module/bluetooth/parameters/disable_ertm &> /dev/null

function proxy-enable() {
    export {http,https}_proxy="socks5://127.0.0.1:1873"
}

function proxy-disable() {
    unset {http,https}_proxy
}

function get-public-ip() {
    curl ifconfig.co
}

export -f {enable,disable}-proxy
export -f get-public-ip
