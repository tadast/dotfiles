#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

sudo apt install -y \
  krita \
  xclip \
  flameshot \
  vlc \
  gnome-tweak-tool
