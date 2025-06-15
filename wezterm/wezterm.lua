local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action
local mux = wezterm.mux

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

config = {
	enable_wayland = false,
	color_scheme = "Catppuccin Frappe",
	font = wezterm.font("JetBrains Mono", { weight = "Bold" }),
	font_size = 16,
	adjust_window_size_when_changing_font_size = false,
	automatically_reload_config = true,
	window_decorations = "RESIZE",
	window_background_opacity = 0.9,
	default_cursor_style = "BlinkingBlock",
	hide_tab_bar_if_only_one_tab = false,
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	tab_and_split_indices_are_zero_based = true,

	window_padding = {
		left = 25,
		right = 25,
		top = 15,
		bottom = 15,
	},

	mouse_bindings = {
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = act.OpenLinkAtMouseCursor,
		},
	},

	leader = {
		key = "q",
		mods = "CTRL",
		timeout_milliseconds = 2000,
	},

	keys = {

		{
			mods = "LEADER",
			key = "m",
			action = wezterm.action.TogglePaneZoomState,
		},
		{
			mods = "CTRL",
			key = "C",
			action = wezterm.action.CopyTo("ClipboardAndPrimarySelection"),
		},
		{
			mods = "CTRL",
			key = "+",
			action = wezterm.action.IncreaseFontSize,
		},
		{
			mods = "CTRL",
			key = "-",
			action = wezterm.action.DecreaseFontSize,
		},
		{
			mods = "LEADER",
			key = "c",
			action = wezterm.action.SpawnTab("CurrentPaneDomain"),
		},
		{
			mods = "LEADER",
			key = "x",
			action = wezterm.action.CloseCurrentPane({ confirm = true }),
		},
		{
			mods = "LEADER",
			key = "b",
			action = wezterm.action.ActivateTabRelative(-1),
		},
		{
			mods = "LEADER",
			key = "n",
			action = wezterm.action.ActivateTabRelative(1),
		},
		{
			mods = "LEADER",
			key = "v",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			mods = "LEADER",
			key = "-",
			action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			mods = "LEADER",
			key = "h",
			action = wezterm.action.ActivatePaneDirection("Left"),
		},
		{
			mods = "LEADER",
			key = "j",
			action = wezterm.action.ActivatePaneDirection("Down"),
		},
		{
			mods = "LEADER",
			key = "k",
			action = wezterm.action.ActivatePaneDirection("Up"),
		},
		{
			mods = "LEADER",
			key = "l",
			action = wezterm.action.ActivatePaneDirection("Right"),
		},
		{
			mods = "LEADER",
			key = "LeftArrow",
			action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
		},
		{
			mods = "LEADER",
			key = "RightArrow",
			action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
		},
		{
			mods = "LEADER",
			key = "DownArrow",
			action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
		},
		{
			mods = "LEADER",
			key = "UpArrow",
			action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
		},

		{
			mods = "LEADER",
			key = "a",
			action = act.AttachDomain("unix"),
		},

		{
			mods = "LEADER",
			key = "d",
			action = act.DetachDomain({ DomainName = "unix" }),
		},
	},
}
config.unix_domains = {
	{
		name = "unix",
	},
}

wezterm.on("update-right-status", function(window, _)
	local SOLID_LEFT_ARROW = ""
	local ARROW_FOREGROUND = { Foreground = { Color = "#303446" } }
	local prefix = ""

	if window:leader_is_active() then
		prefix = " " .. utf8.char(0x1f30a) -- ocean wave
		SOLID_LEFT_ARROW = utf8.char(0xe0b2)
	end

	if window:active_tab():tab_id() ~= 0 then
		ARROW_FOREGROUND = { Foreground = { Color = "#CA9EE6" } }
	end -- arrow color based on if tab is first pane

	window:set_left_status(wezterm.format({
		{ Background = { Color = "#b7bdf8" } },
		{ Text = prefix },
		ARROW_FOREGROUND,
		{ Text = SOLID_LEFT_ARROW },
	}))
end)

return config
