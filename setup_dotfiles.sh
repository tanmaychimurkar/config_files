#!/usr/bin/env bash

# Script to copy dotfiles from the repo to the home directory

# Path to the dotfiles repo
DOTFILES_REPO="$HOME/dotfiles"

# Path to the home directory
HOME_DIR="$HOME"

# List of dotfiles to copy
DOTFILES=(bashrc bash_aliases ideavimrc gitconfig tmux.conf )

# Copy dotfiles to the home directory
for file in "${DOTFILES[@]}"; do
    mv "$file" ".$file"
    cp -r "$DOTFILES_REPO/.$file" "$HOME_DIR"
done
