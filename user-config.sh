#!/bin/bash

function set_bashrc_path() {
  DIR="$1"
  RC_FILE="$HOME/.bashrc"
  if [[ -d "$DIR" ]]; then
    SNIPPET="PATH=$DIR"
    grep -q "$SNIPPET" "$RC_FILE" || echo 'export '"$SNIPPET"':$PATH' >> "$RC_FILE"
  fi
}

set_bashrc_path /opt/alex/3.1.7/bin
set_bashrc_path /opt/happy/1.19.5/bin
set_bashrc_path /opt/cabal/bin
set_bashrc_path /opt/ghc/7.10.3/bin
