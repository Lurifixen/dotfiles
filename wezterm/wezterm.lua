local wezterm = require 'wezterm' 
local config = wezterm.config_builder()
local act = wezterm.action
local mux = wezterm.mux

--Tabline plugin
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

-- tabline.setup({
--   options = {
--     icons_enabled = true,
--     theme = 'Catppuccin Frappe',
--     tabs_enabled = true,
--     theme_overrides = {},
--     section_separators = {
--       left = wezterm.nerdfonts.pl_left_hard_divider,
--       right = wezterm.nerdfonts.pl_right_hard_divider,
--     },
--     component_separators = {
--       left = wezterm.nerdfonts.pl_left_soft_divider,
--       right = wezterm.nerdfonts.pl_right_soft_divider,
--     },
--     tab_separators = {
--       left = wezterm.nerdfonts.pl_left_hard_divider,
--       right = wezterm.nerdfonts.pl_right_hard_divider,
--     },
--   },
--   sections = {
--     tabline_a = { 'mode' },
--     tabline_b = { 'workspace' },
--     tabline_c = { ' ' },
--     tab_active = {
--       'index',
--       { 'parent', padding = 0 },
--       '/',
--       { 'cwd', padding = { left = 0, right = 1 } },
--       { 'zoomed', padding = 0 },
--     },
--     tab_inactive = { 'index', { 'process', padding = { left = 0, right = 1 } } },
--     tabline_x = { 'ram', 'cpu' },
--     tabline_y = { 'datetime', 'battery' },
--     tabline_z = { 'domain' },
--   },
--   extensions = {},
-- })
-- Treat leftALT as ALTGR when CTRL is pressed.
--config.treat_left_ctrlalt_as_altgr = true

-- Disable wayland to work with Hyprland
config.enable_wayland = false

-- ColorScheme
config.color_scheme = 'Catppuccin Frappe'

-- Font config
config.font = wezterm.font 'JetBrainsMono'
config.font_size = 14
config.adjust_window_size_when_changing_font_size = false
config.automatically_reload_config = true

-- Window decorations
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.9

-- Window padding
config.window_padding = {
  left = 25,
  right = 25,
  top = 15,
  bottom = 15,
}

-- cursor
config.default_cursor_style = 'BlinkingBlock'
config.mouse_bindings = {
    -- Open URLs with Ctrl+Click
    {
        event = { Up = { streak = 1, button = 'Left' } },
        mods = 'CTRL',
        action = act.OpenLinkAtMouseCursor,
    }
}
-- tab bar
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true

-- tmux
config.leader = { key = "q", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
  
  { key = 'C', mods = 'CTRL', action = wezterm.action.CopyTo 'ClipboardAndPrimarySelection' },
  { key = '+', mods = 'CTRL', action = wezterm.action.IncreaseFontSize },
  { key = '-', mods = 'CTRL', action = wezterm.action.DecreaseFontSize },
  { mods = "LEADER", key = "c", action = wezterm.action.SpawnTab "CurrentPaneDomain", },
  { mods = "LEADER", key = "x", action = wezterm.action.CloseCurrentPane { confirm = true } },
  { mods = "LEADER", key = "b", action = wezterm.action.ActivateTabRelative(-1) },
  { mods = "LEADER", key = "n", action = wezterm.action.ActivateTabRelative(1) },
  { mods = "LEADER", key = "v", action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" } },
  { mods = "LEADER", key = "-", action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" } },
  { mods = "LEADER", key = "h", action = wezterm.action.ActivatePaneDirection "Left"},
  { mods = "LEADER", key = "j", action = wezterm.action.ActivatePaneDirection "Down"},
  { mods = "LEADER", key = "k", action = wezterm.action.ActivatePaneDirection "Up"},
  { mods = "LEADER", key = "l", action = wezterm.action.ActivatePaneDirection "Right"},
  { mods = "LEADER", key = "LeftArrow", action = wezterm.action.AdjustPaneSize { "Left", 5 } },
  { mods = "LEADER", key = "RightArrow", action = wezterm.action.AdjustPaneSize { "Right", 5 } },
  { mods = "LEADER", key = "DownArrow", action = wezterm.action.AdjustPaneSize { "Down", 5 } },
  { mods = "LEADER", key = "UpArrow", action = wezterm.action.AdjustPaneSize { "Up", 5 } },
  
  -- Attach to muxer
  { key = 'a', mods = 'LEADER', action = act.AttachDomain 'unix' },

  -- Detach from muxer
  { key = 'd', mods = 'LEADER', action = act.DetachDomain { DomainName = 'unix' }, },
 
}


-- tmux status
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

    window:set_left_status(wezterm.format {
        { Background = { Color = "#b7bdf8" } },
        { Text = prefix },
        ARROW_FOREGROUND,
        { Text = SOLID_LEFT_ARROW }
    })
end)

config.unix_domains = {
  {
    name = 'unix',
  },
}

return config

