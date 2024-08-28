#!/bin/bash

CURRENT_DIR="dotfiles"
BASHRC="$HOME/.bashrc"

echo "[$CURRENT_DIR] Beginning installation..."

# Install the files that are used across tools
if [ ! -f "$BASHRC" ]; then
    echo "[$CURRENT_DIR] Creating $BASHRC as it did not exist..."
    touch "$BASHRC"
fi

# Go through all tools and install them
for entry in ./*; do
    if [ -d "$entry" ]; then
        if [ -f "$entry/install.sh" ]; then
            bash "${entry}/install.sh"
        else
            echo "[dotfiles] No install script found in $entry"
        fi
    fi
done

# Source the necessary files
source "$BASHRC"
