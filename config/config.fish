#Basic settings
set fish_greeting                      # Supresses fish's intro message
set -x TERM "xterm-256color"              # Sets the terminal type
set -x EDITOR "emacsclient -t -a ''"      # $EDITOR use Emacs in terminal
set -x VISUAL "emacsclient -c -a emacs"   # $VISUAL use Emacs in GUI mode
set -x JAVA_HOME /usr/lib/jvm/java-8-openjdk
set -x PATH $PATH ~/.emacs.d/bin
set -x PATH $PATH /opt/liquibase
fish_vi_key_bindings

# Abbrs
abbr -a ls "ls --color=always"
abbr -a la "ls -A"
abbr -a ll "ls -ahlF"
abbr -a lg "ls -ahlF | grep -i"
abbr -a df "df -h"
abbr -a du "du -h -d 1"
abbr -a hg "history | grep"
abbr -a pg "pgrep -f -a"
abbr -a pk "pkill -f"
abbr -a kp "kill -9"
abbr -a grep "grep -i --color=auto"
abbr -a g "git"
abbr -a v "vim"
abbr -a o "xdg-open"
abbr -a e "emacsclient"
abbr -a z "zathura --fork"
abbr -a dk "sudo docker"
abbr -a dc "sudo docker-compose"
abbr -a gd "goldendict"
abbr -a sv "sudo vim"
abbr -a ec "emacsclient -n -c"
abbr -a hi "history"
abbr -a yay "yay --noconfirm"
abbr -a yaya "yay --aur"
abbr -a yayr "yay --repo"
abbr -a yaysyu "yay --noconfirm -Syu"
abbr -a cdot "cd ~/dotfiles/config"
abbr -a ns "netstat -tulnp"
abbr -a ng "netstat -tulnp | grep"
abbr -a sc "systemctl"
abbr -a scu "systemctl --user"
abbr -a jc "journalctl"
abbr -a jcu "journalctl --user"
abbr -a rmd "rmdir"
abbr -a sshnc "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"

### PROMPT ###
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


thefuck --alias | source
