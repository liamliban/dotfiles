-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Change Theme
config.color_scheme = "Catppuccin Mocha"

config.window_background_opacity = 0.9
config.macos_window_background_blur = 50

-- Set zsh as default shell
config.default_prog = { "/bin/zsh", "-l" }

-- no header
config.window_decorations = "RESIZE"

-- no tabs
config.enable_tab_bar = false

return config
