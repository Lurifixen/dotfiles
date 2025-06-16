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
config.font = wezterm.font({ family = "JetBrains Mono" })
config.bold_brightens_ansi_colors = true
config.adjust_window_size_when_changing_font_size = false
config.font_rules = {
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font({ family = "Maple Mono", weight = "Bold", style = "Italic" }),
	},
	{
		italic = true,
		intensity = "Half",
		font = wezterm.font({ family = "Maple Mono", weight = "DemiBold", style = "Italic" }),
	},
	{
		italic = true,
		intensity = "Normal",
		font = wezterm.font({ family = "Maple Mono", style = "Italic" }),
	},
}

-- Window settings
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.9
config.window_padding = { left = 25, right = 25, top = 15, bottom = 15 }

-- Tab settings
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true

-- Tab
return config
