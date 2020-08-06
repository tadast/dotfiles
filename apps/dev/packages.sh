#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

sudo apt install -y \
  ansible \
  redis-server \
  tilix \
  meld
