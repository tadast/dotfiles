#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

sudo apt install -y \
  ansible \
  libffi-dev \
  python-dev \
  redis-server \
  tilix \
  meld
