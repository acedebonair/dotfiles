#!/bin/zsh

export CONFIG_HOME="$HOME/.config"
export CACHEDIR="$HOME/.cache"

# ALIASES
[ -f "$CONFIG_HOME/.aliases" ] && source "$CONFIG_HOME/.aliases"
[ -f "$CONFIG_HOME/.shortcutrc" ] && source "$CONFIG_HOME/.shortcutrc"

# NVIM
export NVIMDIR="$CONFIG_HOME/nvim"
export NVIMUNDODIR="$NVIMDIR/undodir"

# PLUGIN MANAGER
export ZPLUGIN_DIR="$ZDOTDIR/zinit"
export ZINIT_HOME="$ZPLUGIN_DIR/zinit.git"

# Default programs:
export EDITOR='lvim'

# Nvm
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# dotnet
export DOTNET_ROOT="/opt/dotnet"
pathappend "$DOTNET_ROOT"

# brew
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
[ -d "/home/linuxbrew/.linuxbrew/bin" ] && pathappend "/home/linuxbrew/.linuxbrew/bin"
[ -d "$HOME/.linuxbrew/bin" ] && pathappend "$HOME/.linuxbrew/bin"

# bin
pathappend "$HOME/.local/bin"

# pyenv init
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

# yarn version manager
export YVM_DIR="$HOME/.yvm"
[ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh

# cargo
[ -f "$HOME/.cargo/env" ] && \. "$HOME/.cargo/env"

# gpg
export GPG_TTY=$(tty)
