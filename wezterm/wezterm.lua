local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action
local mux = wezterm.mux

-- require("mux").setup(config)
require("status")
require("keys").setup(config)

-- Config auto reload
config.automatically_reload_config = true

-- Disable wayland support workaround for Hyprland
config.enable_wayland = false

-- ColorScheme
config.color_scheme = "Catppuccin Frappe"

-- Fonts
config.font_size = 16
config.font = wezterm.font("JetBrains Mono", { weight = "Medium" })
-- config.line_height = 1.3
config.bold_brightens_ansi_colors = true
config.adjust_window_size_when_changing_font_size = false

-- Window settings
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.95
config.window_padding = { left = 25, right = 25, top = 15, bottom = 15 }

-- Tab settings
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true

-- Tab
return config
