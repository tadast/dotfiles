#!/bin/bash

# Use your phone as a webcam
set -euo pipefail
IFS=$'\n\t'

if ! command -v "droidcam" &> /dev/null; then
  sudo apt update -y
  sudo apt install -y wget
  sudo apt install linux-headers-`uname -r` gcc make

  wget https://files.dev47apps.net/linux/droidcam_latest.zip -O /tmp/droidcam_latest.zip
  unzip /tmp/droidcam_latest.zip -d /tmp/droidcam
  cd /tmp/droidcam && sudo ./install-client && sudo ./install-video
fi
