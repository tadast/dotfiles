#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

if ! [[ -f ~/z.sh ]]; then
  sudo apt install -y wget
  wget https://raw.githubusercontent.com/rupa/z/master/z.sh -O ~/z.sh
  sudo chmod +x ~/z.sh
fi
