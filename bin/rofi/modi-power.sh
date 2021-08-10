#!/usr/bin/env bash

function list-options() {
    echo "lock"
    echo "logout"
    echo "poweroff"
    echo "reboot"
    echo "reload-keymap"
    echo "sleep"
    echo "hibernate"
    echo "hybrid-sleep"
    echo "timed-hibernate"
}

function do-action() {
    case "$1" in
        "lock")
            dunstify "Lock function is not supported yet."
            ;;
        "logout")
            bspc quit
            ;;
        "poweroff")
            poweroff
            ;;
        "reboot")
            reboot
            ;;
        "relaod-keymap")
            systemctl --user restart sxhkd
            ;;
        "sleep")
            systemctl suspend
            ;;
        "hibernate")
            systemctl hibernate
            ;;
        "hybrid-sleep")
            systemctl hybrid-sleep
            ;;
        "timed-hibernate")
            systemctl suspend-then-hibernate
            ;;
        *)
            echo "Unsupported command: $1"
            ;;
    esac
}

if [ -z "$*" ]; then
    list-options    
else
    do-action "$1"
fi
