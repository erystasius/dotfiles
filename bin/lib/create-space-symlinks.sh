#!/usr/bin/env bash

if [ ! -e ~/space/Downloads ]; then
    ln -s ~/Downloads ~/space/Downloads
fi

if [ ! -e ~/space/Desktop ]; then
    ln -s ~/Desktop ~/space/Desktop
fi
