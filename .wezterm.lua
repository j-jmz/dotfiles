-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font_with_fallback({ "Hack", "JetBrains Mono" })
config.font_size = 12

config.enable_tab_bar = false

config.window_decorations = "TITLE | RESIZE"

config.window_background_opacity = 0.8

-- and finally, return the configuration to wezterm
return config
