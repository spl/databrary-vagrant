#!/bin/bash

function git_install() {
  REPOSITORY="$1"
  TARGET_DIR="$2"
  if [[ -d "$TARGET_DIR" ]]; then
    echo "$(basename $TARGET_DIR)"
    pushd "$TARGET_DIR" &> /dev/null
    git pull > /dev/null
    popd &> /dev/null
  else
    git clone --recursive "$REPOSITORY" "$TARGET_DIR"
    pushd "$TARGET_DIR" &> /dev/null
    git config --local user.email 'sean.leather@gmail.com'
    popd &> /dev/null
  fi
  sh "$TARGET_DIR"/install.sh
}

git_install 'https://github.com/spl/databrary-ubuntu-config.git' "$HOME/._config"
