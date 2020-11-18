#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

if ! command -v "zoom" &> /dev/null; then
  sudo apt update -y
  sudo apt install -y wget

  wget https://zoom.us/client/latest/zoom_amd64.deb -O /tmp/zoom.deb
  sudo apt install -y /tmp/zoom.deb
fi
