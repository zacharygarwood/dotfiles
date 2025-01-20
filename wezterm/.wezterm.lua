-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Set default domain to WSL2
config.default_domain = "WSL:Ubuntu"

-- This is where you actually apply your config choices
config.keys = {
	{ key = "V", mods = "CTRL", action = act.PasteFrom("Clipboard") },
}
-- Make the terminal *fancy*
config.color_scheme = "Kanagawa (Gogh)"
config.window_decorations = "RESIZE"
config.enable_tab_bar = false

-- Disabling ligatures
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

-- and finally, return the configuration to wezterm
return config
