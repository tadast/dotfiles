#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [[ ! -d $HOME/.fonts/truetype/dejavu-sans-mono ]]; then
  sudo apt install -y wget
  wget -O /tmp/dejavu.zip https://www.fontsquirrel.com/fonts/download/dejavu-sans-mono
  mkdir -p $HOME/.fonts/truetype/dejavu-sans-mono
  unzip /tmp/dejavu.zip -d $HOME/.fonts/truetype/dejavu-sans-mono/
fi
