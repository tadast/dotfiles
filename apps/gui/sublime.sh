#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

if ! command -v "subl" &> /dev/null; then
  sudo apt update -y
  sudo apt install -y wget
  wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
  sudo apt install -y apt-transport-https
  echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
  sudo apt update -y
  sudo apt install -y sublime-text
fi
