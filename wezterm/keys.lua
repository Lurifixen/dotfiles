local wezterm = require("wezterm")

local act = wezterm.action
local M = {}

function M.setup(config)
	config.leader = { key = "q", mods = "CTRL", timeout_milliseconds = 2000 }
	config.keys = {
		{ mods = "LEADER", key = "m", action = act.TogglePaneZoomState },
		{ mods = "CTRL", key = "C", action = act.CopyTo("ClipboardAndPrimarySelection") },
		{ mods = "CTRL", key = "+", action = act.IncreaseFontSize },
		{ mods = "CTRL", key = "-", action = act.DecreaseFontSize },
		{ mods = "LEADER", key = "c", action = act.SpawnTab("CurrentPaneDomain") },
		{ mods = "LEADER", key = "x", action = act.CloseCurrentPane({ confirm = true }) },
		{ mods = "LEADER", key = "b", action = act.ActivateTabRelative(-1) },
		{ mods = "LEADER", key = "n", action = act.ActivateTabRelative(1) },
		{ mods = "LEADER", key = "v", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ mods = "LEADER", key = "-", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ mods = "LEADER", key = "h", action = act.ActivatePaneDirection("Left") },
		{ mods = "LEADER", key = "j", action = act.ActivatePaneDirection("Down") },
		{ mods = "LEADER", key = "k", action = act.ActivatePaneDirection("Up") },
		{ mods = "LEADER", key = "l", action = act.ActivatePaneDirection("Right") },
		{ mods = "LEADER", key = "LeftArrow", action = act.AdjustPaneSize({ "Left", 5 }) },
		{ mods = "LEADER", key = "RightArrow", action = act.AdjustPaneSize({ "Right", 5 }) },
		{ mods = "LEADER", key = "DownArrow", action = act.AdjustPaneSize({ "Down", 5 }) },
		{ mods = "LEADER", key = "UpArrow", action = act.AdjustPaneSize({ "Up", 5 }) },
		{ mods = "LEADER", key = "a", action = act.AttachDomain("unix") },
		{ mods = "LEADER", key = "d", action = act.DetachDomain({ DomainName = "unix" }) },
	}
end

return M
