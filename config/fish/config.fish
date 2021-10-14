####### Fish
set fish_greeting                      # Supresses fish's intro message

####### vi mode
fish_vi_key_bindings
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
bind -M insert -m default jj backward-char force-repaint 

######## Env
set -x TERM "xterm-256color"              # Set terminal type
set -x PAGER "less"                       # Set pager
set -x EDITOR "emacsclient -t -a ''"      # $EDITOR use Emacs in terminal
set -x VISUAL "emacsclient -c -a emacs"   # $VISUAL use Emacs in GUI mode
set -x PATH $PATH ~/.emacs.d/bin
set -x PATH $PATH ~/.local/bin/install
set -x PATH $PATH ~/.local/bin/setup
#set -x _JAVA_OPTIONS "-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Djdk.gtk.version="

####### Less
set -xU LESS_TERMCAP_md (printf "\e[01;31m")
set -xU LESS_TERMCAP_me (printf "\e[0m")
set -xU LESS_TERMCAP_so (printf "\e[01;44;33m")
set -xU LESS_TERMCAP_se (printf "\e[0m")
set -xU LESS_TERMCAP_us (printf "\e[01;32m")
set -xU LESS_TERMCAP_ue (printf "\e[0m")

####### Abbr
# cd
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias cs='cd ~/space'
alias ubin='cd ~/.local/bin'
alias ushare='cd ~/.local/share'
alias uconfig='cd ~/.config'
# ls
# -g --grid -l --long -x --across -F --classify
alias lc "exa --color=never"
alias ls "exa -aGxF --color=always --group-directories-first"
alias la "exa -aGxF --color=always --group-directories-first"
alias ll "exa -algF --color=always --group-directories-first --time-style=long-iso --git"
alias lg "exa -algF --color=always --group-directories-first --time-style=long-iso --git | grep -i"
# cat
abbr -a cat "bat"
# cp
abbr -a cp "cp -r"
# mkdir
abbr -a mkdir "mkdir --parents"
# df & du
abbr -a df "df -h"
abbr -a du "du -h -d 1"
# history
abbr -a hi "history"
abbr -a hf "history | fzf | xargs -I {} fish --command \"{}\""
abbr -a hg "history | grep"
# git & vim & emacs
abbr -a g "git"
abbr -a v "nvim"
abbr -a sv "sudo nvim"
abbr -a vim "nvim"
abbr -a e "devour emacsclient --create-frame"
abbr -a se "sudo devour emacsclient --create-frame"
# docker
abbr -a dk "sudo docker"
abbr -a dc "sudo docker-compose"
# yay
abbr -a yay "yay --repo --noconfirm"
abbr -a yaa "yay --aur --noconfirm"
abbr -a yaysyu "yay --repo --noconfirm -Syyu"
abbr -a yaasyu "yay --aur --noconfirm -Syyu"
abbr -a yayclr "yay --noconfirm -Rns (yay -Qtdq)"
# systemd
abbr -a sc "systemctl"
abbr -a scu "systemctl --user"
abbr -a jc "journalctl"
abbr -a jcu "journalctl --user"
abbr -a jcerr "journalctl --boot --catalog --priority=3"
abbr -a sysd-verify "systemd-analyze verify"
# clip
abbr -a clip "xclip -selection c"
abbr -a clipc "xclip -selection c"
abbr -a clipv "xclip -selection c -o"
# dotfiles
abbr -a dot "cd ~/dotfiles"
abbr -a pdot "cd ~/pdotfiles"
abbr -a bdot "cd ~/dotfiles/bin"
abbr -a sdot "cd ~/dotfiles/share"
abbr -a cdot "cd ~/dotfiles/config"
abbr -a edot "vim ~/dotfiles/install.conf.yaml"
abbr -a fdot "vim (fd --base-directory ~/dotfiles/config -t f . | fzf | xargs -I {} echo $HOME/dotfiles/config/{})"
abbr -a dot-edit "vim ~/dotfiles/install.conf.yaml"
abbr -a dot-sync "git -C ~/dotfiles stash && git -C ~/dotfiles pull && git -C ~/dotfiles stash pop"
abbr -a dot-find "vim (fd --base-directory ~/dotfiles/config -t f . | fzf | xargs -I {} echo $HOME/dotfiles/config/{})"
abbr -a dot-status "git -C ~/dotfiles status"
abbr -a dot-install "sh ~/dotfiles/install"
# process
abbr -a pg "pgrep -f -a"
abbr -a pk "pkill -f"
abbr -a kp "kill -9"
# cal
abbr -a cal "cal -3 --monday"
abbr -a calw "cal -3 --monday --week"
# date
abbr -a date "date +\"W%V, %A    %F %T    %:z %Z    %s\""
abbr -a dateu "date --utc +\"W%V, %A    %F %T    %:z %Z    %s\""
abbr -a datei "date --iso-8601=s"
abbr -a dateui "date --utc --iso-8601=s"
abbr -a datex "date +%s"
# net
abbr -a ns "netstat -tulnp"
abbr -a ng "netstat -tulnp | grep"
# wc
abbr -a wcl "wc --lines"
abbr -a wcw "wc --words"
# shorten
abbr -a o "devour xdg-open"
abbr -a gp "grep -i --color=auto"
abbr -a rmd "rmdir"
abbr -a rmf "rm -rf"
abbr -a getip "curl ipinfo.io"
# long
abbr -a ery-clone-doom "git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d"
abbr -a ery-test-key "xev | awk -F '[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf \"%-3s %s\n\", \$5, \$8 }'"
# testing
abbr -a no-color "sed 's/\x1B\[[0-9;]\{1,\}[A-Za-z]//g'"
abbr -a gen-mv-script "ls | sed 's/\x1B\[[0-9;]\{1,\}[A-Za-z]//g' | xargs -I {} echo \"mv {} {}\" > batch-mv.sh && vim batch-mv.sh"


####### Functions
# Function for printing a column (splits input on whitespace)
# ex: echo 1 2 3 | coln 3
# output: 3
function coln
    while read -l input
        echo $input | awk '{print $'$argv[1]'}'
    end
end

# Function for printing a row
# ex: seq 3 | rown 3
# output: 3
function rown --argument index
    sed -n "$index p"
end
