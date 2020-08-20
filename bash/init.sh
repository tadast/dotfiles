HISTSIZE=100000
HISTFILESIZE=2000000

export EDITOR=vim

export PATH="$PATH:$HOME/.dotfiles/scripts"

# Setup g to use git completions
complete -o default -o nospace -F _git g
# Source git completions
source /usr/share/bash-completion/completions/git

source ~/.dotfiles/bash/init/ps1.sh
source ~/.dotfiles/bash/init/yarn-completion.sh
source ~/.dotfiles/bash/init/golang.sh
source ~/.dotfiles/bash/init/aliases.sh
source ~/.dotfiles/bash/init/asdf.sh
source ~/.dotfiles/bash/init/zet.sh

# make CTRL-W kill words up until \
bind '\C-w:backward-kill-word'

# Nodejs
export PATH="$PATH:node_modules/.bin"
export PATH="$PATH:$HOME/.yarn/bin"

# Golang
export PATH=$PATH:~/go/bin

# Ansible
export ANSIBLE_VAULT_PASSWORD_FILE="$HOME/.secrets/ansible/vault_password/pass"
