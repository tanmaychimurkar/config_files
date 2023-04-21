#!/bin/bash

function usage {
  echo "Run using: bash format.sh [OPTIONS]"
  echo "Usage: $0 [OPTIONS]"
  echo "OPTIONS:"
  echo " --help, -h: Script usage help"
  echo " --format [FILE]: format the given file"
  echo " --lint [FILE]: check linting for the given file"
}

function format() {

  file_path=$1

  if [[ -z $file_path ]]; then
    echo "Please provide the path of the file to format. The relative path from the root of the repository is expected."
    exit 1
  elif [[ -n $file_path  ]]; then
    if [[ -e $file_path ]]; then
      echo "The file ($1) will be formatted by the following formatters:
      1) autoflake: remove unnecessary imports and variables
      2) isort: sort imports as per the configuration in pyproject.toml
      3) black: format code as per the configuration in pyproject.toml
      4) flake8: check for code style violations
      "
      autoflake "$file_path"
      isort "$file_path"
      black "$file_path"

      echo "The file ($file_path) is formatted successfully."
    else
      echo "The file ($file_path) does not exists from the root of the repository. Please provide the correct
      path of the file to format."
    fi
  fi
}

function lint() {

  file_path=$1

  if [[ -z $file_path ]]; then
    echo "Please provide the path of the file to lint. The relative path from the root of the repository is expected."
    exit 1
  elif [[ -n $file_path  ]]; then
    if [[ -e $file_path ]]; then
      echo "The file ($1) will be checked for differences and linting by the following formatters:
      1) autoflake: it will be checked if there are any unused (or) unnecessary imports
      2) isort: the order of the imports will be checked
      3) black: the code will be checked for any differences in formatting
      4) flake8: check for code style violations
      "

      command autoflake --check "$file_path"
      command isort --check "$file_path"
      command black --check "$file_path"

      echo "The linting and formatting for the file ($file_path) is checked successfully. Please use the '--format'
      flag to format the file if you see any changes."
    else
      echo "The file ($file_path) does not exists from the root of the repository. Please provide the correct
      path of the file to check formatting and linting."
    fi
  fi
}

while [[ $# -gt 0 ]]
do
 key="$1"
 file="$2"

case $key in
  -h|--help)
  usage
  exit 0
  ;;
--format)
  format "$file"
  exit 0
  ;;
--lint)
  lint "$file"
  exit 0
  ;;
  *)
  echo "Invalid Option $key"
  usage
  exit 1
  ;;
esac
done

