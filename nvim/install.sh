#!/bin/bash

NVIM="nvim"
INSTALL_LOCATION="/tmp/nvim-linux64.tar.gz"
BASHRC="$HOME/.bashrc"
NVIM_BASHRC_EXPORT="export PATH=\$PATH:/opt/nvim-linux64/bin"

echo "[$NVIM] Starting install..."

if [ ! -f "$INSTALL_LOCATION" ]; then
    curl -Lo "$INSTALL_LOCATION" https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
    sudo rm -rf /opt/nvim
    sudo tar -C /opt -xzf "$INSTALL_LOCATION"
fi

if ! grep -q "$NVIM_BASHRC_EXPORT" "$BASHRC"; then
    echo "[$NVIM] Appending nvim export to $BASHRC"
    echo "$NVIM_BASHRC_EXPORT" >> "$BASHRC"
fi

echo "[$NVIM] Done c:"
