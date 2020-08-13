#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

if ! command -v "aws" &> /dev/null; then
  sudo apt install -y curl unzip
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo ./aws/install
  rm -rf aws
  rm -rf awscliv2.zip
fi
