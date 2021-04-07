#!/usr/bin/env bash
uuid=$(dmidecode -s system-uuid)
echo "Detecting system uuid: $uuid"

case $uuid in
  112479b8-2961-11ea-80db-f875a47dc418)
    echo "Setting up for erystasius-ultra."
    /bin/bash setup-ultra.sh
    ;;

  *)
    echo "This device is unfamiliar to me, you're on your own now."
    ;;
esac
