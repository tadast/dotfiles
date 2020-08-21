#!/bin/bash
set -euo pipefail
IFS=$'\n\t'
GTT_EXTENSIONS_DIR=~/.local/share/gnome-shell/extensions

if [[ ! -d $GTT_EXTENSIONS_DIR/maxi@darkretailer.github.com ]]; then
  sudo apt install -y gnome-tweak-tool

  mkdir -p ~/.local/share/gnome-shell/extensions

  git clone git@github.com:darkretailer/gnome-shell-extension_maxi.git $GTT_EXTENSIONS_DIR/maxi@darkretailer.github.com
fi
