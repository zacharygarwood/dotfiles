#!/bin/bash

NVIM="nvim"
NVIM_LOCATION="/opt/nvim-linux64"
INSTALL_LOCATION="/tmp/nvim-linux64.tar.gz"
BASHRC="$HOME/.bashrc"
NVIM_BASHRC_EXPORT="export PATH=\$PATH:/opt/nvim-linux64/bin"
FONT_LOCATION="$HOME/.local/share/fonts"

echo "[$NVIM] Starting install..."

if [ ! -d "$NVIM_LOCATION" ]; then
    curl -Lo "$INSTALL_LOCATION" https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
    sudo rm -rf /opt/nvim
    sudo tar -C /opt -xzf "$INSTALL_LOCATION"
fi

if ! grep -q "$NVIM_BASHRC_EXPORT" "$BASHRC"; then
    echo "[$NVIM] Appending nvim export to $BASHRC"
    echo "$NVIM_BASHRC_EXPORT" >> "$BASHRC"
fi

# This check is a little hacky. I could pipe ls into grep and check for JetBrainsMono
# but then I'd need to do it for each font. Hmmm TODO
if [ ! -f "$FONT_LOCATION/README.md" ]; then
    echo "[$NVIM] Installing JetBrainsMono NerdFont"
    wget -P "$FONT_LOCATION" https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip \
        && unzip "$FONT_LOCATION/JetBrainsMono.zip" -d "$FONT_LOCATION" \
        && rm "$FONT_LOCATION/JetBrainsMono.zip" \
        && fc-cache -fv
fi

# TODO: Need to link the nvim files to $HOME/.config/nvim


echo "[$NVIM] Done c:"
