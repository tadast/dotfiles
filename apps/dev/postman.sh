#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

if ! command -v "postman" &> /dev/null; then
  sudo snap install postman
fi
