#!/bin/bash

CURRENT_DIR="dotfiles"

echo "[$CURRENT_DIR] Beginning installation..."
for entry in ./*; do
    if [ -d "$entry" ]; then
        if [ -f "$entry/install.sh" ]; then
            bash "${entry}/install.sh"
        else
            echo "[dotfiles] No install script found in $entry"
        fi
    fi
done
