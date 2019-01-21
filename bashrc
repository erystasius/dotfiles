alias ls="ls --color=always"
alias la="ls -A"
alias ll="ls -alF"
alias lg="ll | grep"
alias df="df -h"
alias du="du -h"
alias hg="history | grep"
alias grep="grep --color=auto"

alias g="git"
alias v="gvim"
alias o="xdg-open"

HISTCONTROL=ignoredups:erasedups

export PS1="\[$(tput bold)\][\[$(tput sgr0)\]\[\033[38;5;107m\]\A\[$(tput sgr0)\]\[\033[38;5;15m\]] \[$(tput sgr0)\]\[\033[38;5;220m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;9m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;69m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\] \\$ \[$(tput sgr0)\]"


eval $(thefuck --alias)
