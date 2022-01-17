#!/bin/zsh

# variables

# DOTFILELS
export DOTFILES_DIR="$HOME/.dotfiles"

# ZSH
export ZDOTDIR="$CONFIG_HOME/zsh"
export ZCACHEDIR="$CACHEDIR/zsh"


# path

function pathappend() {
  for ARG in "$@"; do
    if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
       PATH="${PATH:+"$PATH:"}$ARG"
    fi
  done
}

function pathprepend() {
  for ARG in "$@"; do
    if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
        PATH="$ARG${PATH:+":$PATH"}"
    fi
  done
}

function dotfiles {
	/usr/bin/git --git-dir="$DOTFILES_DIR/" --work-tree="$HOME" "$@"
}

function dotfiles-update-index() {
  # remove unwanted files and update
  # git index

  # ignore and remove readme
  readme_file="$HOME/README.md"
  dotfiles update-index --assume-unchanged "$readme_file"
  if [[ -f "$readme_file" ]]; then
    rm "$readme_file"
  fi

  # ignore and remove install directory files
  while IFS= read -r filename; do
    echo "dotfiles, ignoring file: $filename"
    dotfiles update-index --assume-unchanged "$filename"
    if [[ -f "$filename" ]]; then
      rm "$filename"
    fi
  done < <(dotfiles ls-files "$HOME/install")

  # do cleanup
  if [[ -d "$HOME/install" ]]; then
    rmdir "$HOME/install" >/dev/null 2>&1
  fi

  # let user settings be changed without tracking
  dotfiles update-index --skip-worktree "$ZDOTDIR/user-settings.zsh"
}
