setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# vim
export EDITOR=vim

# scripts
export PATH="$PATH:$HOME/.dotfiles/scripts"

# golang
export PATH="$PATH:/usr/local/go/bin"
export GOPATH="$HOME/gopath"
export PATH="$GOPATH/bin:$PATH"

# Nodejs
export PATH="$PATH:node_modules/.bin"
export PATH="$PATH:$HOME/.yarn/bin"

# Ansible
export ANSIBLE_VAULT_PASSWORD_FILE="$HOME/.secrets/ansible/vault_password/pass"

# source functions for tilix to detect cwd correctly
# https://github.com/gnunn1/tilix/issues/34
source /etc/profile.d/vte-2.91.sh

# asdf
if [[ -f $HOME/.asdf/asdf.sh ]]; then
  . $HOME/.asdf/asdf.sh
fi

# z
if [[ -f $HOME/z.sh ]]; then
  . $HOME/z.sh
fi

if command -v "thefuck" &> /dev/null; then
  eval $(thefuck --alias)
fi

# zsh-autosuggestions

if [[ -f "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
  source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi
bindkey '^o' autosuggest-accept

# zsh-autopair
if [[ -f "$HOME/.zsh/zsh-autopair/autopair.zsh" ]]; then
  source "$HOME/.zsh/zsh-autopair/autopair.zsh"
fi

# scmpuff
if [[ -f "/usr/local/bin/scmpuff" ]]; then
  eval "$(scmpuff init -s)"
fi

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Delete parts of paths not the whole path
my-backward-delete-word() {
    local WORDCHARS=${WORDCHARS/\//}
    zle backward-delete-word
}
zle -N my-backward-delete-word
bindkey '^W' my-backward-delete-word

# Ctrl-left/right to go back and forward words
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Cycle through history based on characters already typed on the line
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "$key[Up]" up-line-or-beginning-search
bindkey "$key[Down]" down-line-or-beginning-search

# Prompt
autoload -U colors && colors
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
precmd() {
  if git rev-parse --git-dir > /dev/null 2>&1; then
    if git status | grep "nothing to commit" > /dev/null 2>&1; then
      zstyle ':vcs_info:git*' formats " %{$reset_color%}(%b)"
    else
      zstyle ':vcs_info:git*' formats " %{$reset_color%}(%b)%F{red}"
    fi
  fi

  vcs_info
}

PROMPT='%F{magenta}$(hostname):%F{blue}%1~%{$reset_color%}${vcs_info_msg_0_} • %{$reset_color%}'

. $HOME/aliases.sh
. $HOME/mfa_alias.sh

