#!/usr/bin/env bash


function list_options() {
    dir=test
    fd . $dir | while read line
    do 
        pinyin=$(pinyin --style NORMAL -h $line)
        echo -en "$line\0meta\x1f$pinyin\n"
    done
}

function do_actions() {
    echo $1;
}

if [ $# -eq 0 ]; then
    list_options    
else
    xdg-open $1
fi
