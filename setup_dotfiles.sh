#!/usr/bin/env bash


function usage {
  echo "Run using: bash setup_dotfiles.sh [OPTIONS]"
  echo "Usage: $0 [OPTIONS]"
  echo "OPTIONS:"
  echo " --help, -h: Script usage help"
  echo " --install_deps : Will install dependencies for the dotfiles"
  echo " --skip_deps : Will skip the installation of the dependencies for the dotfiles"
}

if [ "$#" -ne 1 ]; then
  echo "Choose a flag to install dependencies, --install_deps or --skip_deps"
  echo $'\n'
  exit 1
fi

PASSED_ARG="$1"

if [[ "$PASSED_ARG" == "--help" || "$PASSED_ARG" == "-h" ]]; then
  usage
  exit 0
fi

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

if [[ "$PASSED_ARG" == "--install_deps" ]]; then
  echo "Installation of dependencies"
  source ./dependent_software.sh
elif [[ "$PASSED_ARG" == "--skip_deps" ]]; then
  echo "Skipping the installation of dependencies"
else
  echo "Choose a flag to install either install dependencies, use -h for help"
  echo $'\n'
  exit 1
fi

echo "The shell will be reloaded automatically now\n"

exec "$SHELL"

