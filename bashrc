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

alias e="emacsclient -n"

HISTCONTROL=ignoredups:erasedups
HISTSIZE=1000
HISTFILESIZE=1000

export PS1="\[$(tput bold)\][\[$(tput sgr0)\]\[\033[38;5;107m\]\A\[$(tput sgr0)\]\[\033[38;5;15m\]] \[$(tput sgr0)\]\[\033[38;5;220m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;9m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;69m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\] \\$ \[$(tput sgr0)\]"

eval $(thefuck --alias)

proxy="socks5://127.0.0.1:1873"

function proxy-on() {
    export {http,https}_proxy=$proxy
}

function proxy-off() {
    unset {http,https}_proxy
}

function proxy-status() {
    if [ ! -z $http_proxy ] && [ $proxy = $http_proxy ]; then
        echo "http_proxy: on"
    else
        echo "http_proxy: off"
    fi
    if [ ! -z $https_proxy ] && [ $proxy = $https_proxy ]; then
        echo "https_proxy: on"
    else
        echo "https_proxy: off"
    fi
}

function get-public-ip() {
    curl ifconfig.co
}
