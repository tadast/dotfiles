#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

sudo apt install -y \
  git \
  stow

stow --verbose --dir "$HOME/.dotfiles" --target ~ ctags git ssh vim asdf zsh

