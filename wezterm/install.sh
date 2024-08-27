#~/bin/bash

CURRENT_DIR="$(dirname "$(realpath "$0")")"
WEZTERM_CONFIG=".wezterm.lua"
INSTALL_LOCATION="$HOME/$WEZTERM_CONFIG"
WEZTERM="wezterm"

if [ ! -f "$INSTALL_LOCATION" ]; then
    echo "[$WEZTERM] Creating symlink to $INSTALL_LOCATION"
    ln -s "$CURRENT_DIR/$WEZTERM_CONFIG" "$INSTALL_LOCATION"
else
    echo "[$WEZTERM] $INSTALL_LOCATION already exists skipping"
fi
