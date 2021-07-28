#!/usr/bin/env bash

dir=/home/erystasius/space/Org/unsorted

function py() {
    line=$1
    hans=$(echo $line | rg -oP '[\p{Han}]')
    #if [ -n "$hans" ]; then
        pinyin=$(pinyin -h -s NORMAL $line | sed 's/\s//g')
        echo -e "$line\0meta\x1f$pinyin"
    #else 
    #    echo -e $line
    #fi
}

export -f py

function list_options() {
    fd . $dir | parallel -k py {}
}

function do_action() {
    xdg-open $1
}

if [ -z "$@" ]; then
    list_options    
else
    do_action $1
fi
