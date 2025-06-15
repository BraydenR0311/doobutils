#!/bin/bash

BIN_DIR="$HOME/.local/bin"
COMMANDS=(wp bt changebright changevol bat.sh)

# If it doesn't exist, make it with potential parents.
[ -d "$BIN_DIR" ] || mkdir -pv $BIN_DIR

cp -v "${COMMANDS[@]}" "$BIN_DIR"
