#!/bin/bash
set -euo pipefail
IFS=$'\n\t'
GTT_EXTENSIONS_DIR=~/.local/share/gnome-shell/extensions

if [[ ! -f $GTT_EXTENSIONS_DIR/clipboard-indicator@tudmotu.com ]]; then
  sudo apt install -y gnome-tweak-tool

  mkdir -p ~/.local/share/gnome-shell/extensions

  git clone https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator.git $GTT_EXTENSIONS_DIR/clipboard-indicator@tudmotu.com
fi
