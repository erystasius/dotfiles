set nocompatible    " No compatible with vi
set number          " Enable line number
set relativenumber  " Show relative line number
set cursorline      " Highlight cursor line

set t_Co=256        " 256 color

set encoding=utf-8

syntax on           " Syntax highlight
"colorscheme base16-eighties

set autoindent      " Auto indent
set tabstop=4       " Tab size
set shiftwidth=4    " << >> size
set expandtab       " Use space instead of tab, eg. soft tab
set softtabstop=4   " soft tab size

inoremap jj <ESC>
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

let mapleader=" "
map <leader>y "+y
map <leader>p "+p

set go-=T           " disable munu bar
set go-=r           " disable right-hand scroll bar
