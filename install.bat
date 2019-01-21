@echo off

set home_dir="C:\Users\Erystasius\"
set dotfiles_dir="C:\Users\Erystasius\dotfiles\"

set link=%home_dir%.gitconfig
set target=%dotfiles_dir%gitconfig
mklink %link% %target%

set link=%home_dir%.vimrc
set target=%dotfiles_dir%vimrc
mklink %link% %target%

set link=%home_dir%.emacs.d
set target=%dotfiles_dir%emacs.d
mklink /D %link% %target%
