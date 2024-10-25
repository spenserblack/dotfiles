local wezterm = require("wezterm")

local config = wezterm.config_builder()

local dark_theme = "rose-pine-moon"
local light_theme = "rose-pine-dawn"
local appearance_themes = {
  Light = light_theme,
  Dark = dark_theme,
}
local next_theme = {
  [dark_theme] = light_theme,
  [light_theme] = dark_theme,
}
-- Window colors from https://rosepinetheme.com/palette/
local dark_active_window_bg = "#232136"
local light_active_window_bg = "#faf4ed"
local appearance_active_window_bg = {
  Light = light_active_window_bg,
  Dark = dark_active_window_bg,
}
local next_active_window_bg = {
  [dark_active_window_bg] = light_window_bg,
  [light_active_window_bg] = dark_window_bg,
}
local dark_active_window_fg = "#e0def4"
local light_active_window_fg = "#575279"
local appearance_active_window_fg = {
  Light = light_active_window_fg,
  Dark = dark_active_window_fg,
}
local next_active_window_fg = {
  [dark_active_window_fg] = light_active_window_fg,
  [light_active_window_fg] = dark_active_window_fg,
}

local appearance = wezterm.gui.get_appearance()
config.color_scheme = appearance_themes[appearance] or dark_theme
config.window_frame = {
  active_titlebar_bg = appearance_active_window_bg[appearance] or dark_active_window_bg,
  active_titlebar_fg = appearance_active_window_fg[appearance] or dark_active_window_fg,
  inactive_titlebar_bg = appearance_active_window_bg[appearance] or dark_active_window_bg,
  inactive_titlebar_fg = appearance_active_window_fg[appearance] or dark_active_window_fg,
  button_bg = appearance_active_window_bg[appearance] or dark_active_window_bg,
  button_fg = appearance_active_window_fg[appearance] or dark_active_window_fg,
}

config.window_background_opacity = 0.95

config.leader = { key = "k", mods = "CTRL", timeout_milliseconds = 5000 }
config.keys = {
  {
    key = 'P',
    mods = 'CTRL',
    action = wezterm.action.ActivateCommandPalette,
  },
  {
    key = "x",
    mods = "LEADER",
    action = wezterm.action_callback(function(window, pane)
      local overrides = window:get_config_overrides() or {}
      overrides.color_scheme = next_theme[overrides.color_scheme or config.color_scheme]
      window:set_config_overrides(overrides)
      print("Switched to", overrides.color_scheme)
    end),
  },
}

return config
