#!/usr/bin/env bash
set -euo pipefail

interface=$(~/.local/bin/lib/network.sh get-connected-interface)

downspeed="\${downspeed $interface}"
upspeed="\${upspeed $interface}"

echo "Down: $downspeed - Up: $upspeed"
