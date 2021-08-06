#!/usr/bin/env bash
set -euo pipefail

# see https://github.com/XIU2/TrackersListCollection

cd ~/dotfiles/config/aria2

cp all.trackers all.trackers.bak

wget https://trackerslist.com/all_aria2.txt -O all.trackers
