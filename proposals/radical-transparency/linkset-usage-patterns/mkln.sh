#! /usr/bin/env bash

# get the script's location folder and move into it
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$SCRIPT_DIR"

if [ -z $(which md-reflinks) ]; then
  echo -e "install md-reflinks first\n> uv tool install md-reflinks"
  echo -e "install uv before that\n> cargo install uv"
  echo -e "install rustc, rustup, cargo even before that\n> curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
  echo -e "and if needed update those via rustup\n> rustup update"
  exit 1
fi

md-reflinks -f  master-links.md ??-*.md