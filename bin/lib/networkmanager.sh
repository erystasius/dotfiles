#!/usr/bin/env bash

function get-connected-interface() {
    nmcli device | grep connected | grep ethernet | awk '{print $1}'
}


case "$1" in
    "get-connected-interface") get-connected-interface ;;
    *)                          
        echo "Unrecognized command: $1" 
        ;;
esac 
