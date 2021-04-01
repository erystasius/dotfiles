####### Fish
set fish_greeting                      # Supresses fish's intro message
fish_vi_key_bindings

######## Env
set -x TERM "xterm-256color"              # Set terminal type
set -x PAGER "less"                       # Set pager
set -x EDITOR "emacsclient -t -a ''"      # $EDITOR use Emacs in terminal
set -x VISUAL "emacsclient -c -a emacs"   # $VISUAL use Emacs in GUI mode
set -x PATH $PATH ~/.emacs.d/bin
set -x PATH $PATH /opt/liquibase

####### Abbr
# ls
abbr -a ls "ls --color=always"
abbr -a la "ls -A"
abbr -a ll "ls -ahlF"
abbr -a lg "ls -ahlF | grep -i"
# df & du
abbr -a df "df -h"
abbr -a du "du -h -d 1"
# history
abbr -a hi "history"
abbr -a hg "history | grep"
# git & vim & emacs  
abbr -a g "git"
abbr -a v "vim"
abbr -a e "devour emacsclient --create-frame"
abbr -a sv "sudo vim"
abbr -a se "sudo devour emacsclient --create-frame"
# docker
abbr -a dk "sudo docker"
abbr -a dc "sudo docker-compose"
# yay
abbr -a yay "yay --repo --noconfirm"
abbr -a yaa "yay --aur --noconfirm"
abbr -a yaysyu "yay --repo --noconfirm -Syyu"
abbr -a yaasyu "yay --aur --noconfirm -Syyu"
# systemd
abbr -a sc "systemctl"
abbr -a scu "systemctl --user"
abbr -a jc "journalctl"
abbr -a jcu "journalctl --user"
# clip
abbr -a clip "xclip -selection c"
abbr -a clipc "xclip -selection c"
abbr -a clipv "xclip -selection c -o"
# dotfiles
abbr -a dot "cd ~/dotfiles"
abbr -a cdot "cd ~/dotfiles/config"
abbr -a bdot "cd ~/dotfiles/bin"
abbr -a edot "vim ~/dotfiles/install.conf.yaml"
abbr -a install-dotfiles "sh ~/dotfiles/install"
# application
abbr -a o "xdg-open"
abbr -a z "zathura --fork"
abbr -a gd "goldendict"
# process
abbr -a pg "pgrep -f -a"
abbr -a pk "pkill -f"
abbr -a kp "kill -9"
# net
abbr -a ns "netstat -tulnp"
abbr -a ng "netstat -tulnp | grep"
# shorten
abbr -a gp "grep -i --color=auto"
abbr -a rmd "rmdir"
abbr -a git-clone-dotfiles "git clone https://github.com/erystasius/dotfiles ~/dotfiles"
abbr -a git-clone-doom "git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d"

####### Prompt 
# This was the 'sashimi' prompt from oh-my-fish.
function fish_prompt
  set -l last_status $status
  set -l cyan (set_color -o 98be65)
  set -l yellow (set_color -o yellow)
  set -g red (set_color -o 98be65)
  set -g blue (set_color -o blue)
  set -l green (set_color -o green)
  set -g normal (set_color magenta)
  set -l ahead (_git_ahead)
  set -g whitespace ' '

  if test $last_status = 0
    set initial_indicator "$green◆"
    set status_indicator "$normal❯$cyan❯$green❯"
  else
    set initial_indicator "$red✖ $last_status"
    set status_indicator "$red❯$red❯$red❯"
  end

  set -l cwd $blue(basename (prompt_pwd))

  set -l user_and_host "$cyan$USER @ $hostname"

  if [ (_git_branch_name) ]
    if test (_git_branch_name) = 'master'
      set -l git_branch (_git_branch_name)
      set git_info "$normal git:($red$git_branch$normal)"
    else
      set -l git_branch (_git_branch_name)
      set git_info "$normal git:($blue$git_branch$normal)"
    end
    if [ (_is_git_dirty) ]
      set -l dirty "$yellow ✗"
      set git_info "$git_info$dirty"
    end
  end

  # Notify if a command took more than 5 minutes
  if [ "$CMD_DURATION" -gt 300000 ]
    echo The last command took (math "$CMD_DURATION/1000") seconds.
  end

  echo -n -s $initial_indicator $whitespace $user_and_host $whitespace $cwd $git_info $whitespace $ahead $status_indicator $whitespace
end

function _git_ahead
  set -l commits (command git rev-list --left-right '@{upstream}...HEAD' ^/dev/null)

  if [ $status != 0 ]
    return
  end

  set -l behind (count (for arg in $commits; echo $arg; end | grep '^<'))
  set -l ahead  (count (for arg in $commits; echo $arg; end | grep -v '^<'))

  switch "$ahead $behind"
    case ''     # no upstream
    case '0 0'  # equal to upstream
      return
    case '* 0'  # ahead of upstream
      echo "$blue↑$normal_c$ahead$whitespace"
    case '0 *'  # behind upstream
      echo "$red↓$normal_c$behind$whitespace"
    case '*'    # diverged from upstream
      echo "$blue↑$normal$ahead $red↓$normal_c$behind$whitespace"
  end
end

function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function fish_mode_prompt
  switch $fish_bind_mode
    case default
      set_color --bold red
      echo '(N) '
    case insert
      set_color --bold green
      echo '(I) '
    case replace_one
      set_color --bold green
      echo '(R) '
    case visual
      set_color --bold brmagenta
      echo '(V) '
    case '*'
      set_color --bold red
      echo '(?) '
  end
  set_color normal
end
### END OF PROMPT ###
