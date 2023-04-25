#!/usr/bin/env bash

# Script to copy dotfiles from the repo to the home directory

echo "Configuration files will be copied now to the $HOME directory of this machine"

# Path to the dotfiles repo
DOTFILES_REPO="$HOME/dotfiles"
STARSHIP_CONFIG_FILE="starship.toml"

echo "Dotfiles directory is $DOTFILES_REPO"

# Path to the home directory
HOME_DIR="$HOME"

# List of dotfiles to copy
DOTFILES=(bashrc bash_aliases ideavimrc gitconfig tmux.conf )

echo "List of dotfiles that will be copied are $DOTFILES"

# Copy dotfiles to the home directory
for file in "${DOTFILES[@]}"; do
    if [[ $(< $file) != "$STARSHIP_CONFIG_FILE" ]]; then
        cp -r "$DOTFILES_REPO/$file" "$HOME_DIR"
        mv "$HOME/$file" "$HOME/.$file"
    else:
        cp -r "$DOTFILES_REPO/$file" "$HOME_DIR/.config"
done

echo "The shell will be reloaded now"
exec $SHELL

echo "All dotfiles are now copied (except JetBrains configurations). You are good to go"
