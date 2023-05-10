#!/usr/bin/env bash

# Script to copy dotfiles from the repo to the home directory

echo "Configuration files will be copied now to the $HOME directory of this machine"

# Path to the dotfiles repo
DOTFILES_REPO="$HOME/dotfiles"
EXCLUDED_FILES=("starship.toml" "keybindings.ron")

echo "Dotfiles directory is $DOTFILES_REPO"

HOME_DIR="$HOME"

DOTFILES=("bashrc" "bash_aliases" "ideavimrc" "gitconfig" "tmux.conf")

echo "List of dotfiles that will be copied are $DOTFILES"

for file in "${DOTFILES[@]}"; do
    if [[ ! " ${EXCLUDED_FILES[@]} " =~ " ${file} " ]]; then
        cp -r "$DOTFILES_REPO/$file" "$HOME_DIR"
        mv "$HOME_DIR/$file" "$HOME_DIR/.$file"
    else
        cp -r "$DOTFILES_REPO/$file" "$HOME_DIR/.config"
    fi
done

echo "All dotfiles are now copied (except JetBrains configurations, which need to be copied manually). You are good to go!!"
echo "The shell will be reloaded automatically now"

exec "$SHELL"

