#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

if ! [[ -f ~/.asdf/asdf.sh ]]; then
  sudo apt install -y curl git

  git clone https://github.com/asdf-vm/asdf.git ~/.asdf
  cd ~/.asdf
  git checkout "$(git describe --abbrev=0 --tags)"
  
  cd -
  source ~/.dotfiles/bash/init/asdf.sh

  asdf plugin add nodejs
  asdf plugin add ruby
  asdf plugin add elixir
  asdf plugin add python
fi
