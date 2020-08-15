#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

if ! [[ -f "/usr/local/bin/scmpuff" ]]; then
  sudo apt install -y wget curl

  curl -s https://api.github.com/repos/mroth/scmpuff/releases/latest \
    | grep browser_download_url \
    | grep linux_x64 \
    | cut -d '"' -f 4 \
    | wget -O scmpuff.tar.gz -qi -

  sudo tar -C /usr/local/bin/ -xzf scmpuff.tar.gz
fi
