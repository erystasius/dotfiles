#!/usr/bin/env bash

function get-connected-interface() {
    nmcli device | grep connected | grep ethernet | awk '{print $1}'
}

function get-gateway() {
    interface=$(get-connected-interface)
    nmcli device show $interface | grep IP4.GATEWAY | awk '{print $2}'
}

function get-dns() {
    interface=$(get-connected-interface)
    nmcli device show $interface | grep IP4.DNS | awk '{print $2}'
}

function get-local-ip() {
    interface=$(get-connected-interface)
    nmcli device show $interface | grep IP4.ADDRESS | awk '{print $2}'
}

function get-public-ip() {
    curl --silent www.ipinfo.io/ip
}

function get-public-ip-location() {
    json=$(curl --silent ipinfo.io)
    city=$(echo "$json" | jq --raw-output '.city')
    country=$(echo "$json" | jq --raw-output '.country')
    echo "$country - $city"
    
}

case "$1" in
    "get-connected-interface") 
        get-connected-interface 
        ;;
    "get-local-ip") 
        get-local-ip 
        ;;
    "get-gateway") 
        get-gateway
        ;;
    "get-dns") 
        get-dns
        ;;
    "get-public-ip") 
        get-public-ip 
        ;;
    "get-public-ip-location") 
        get-public-ip-location
        ;;
    *)                          
        echo "Unrecognized command: $1" 
        ;;
esac 
