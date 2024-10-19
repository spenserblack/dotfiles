local wezterm = require("wezterm")

local config = wezterm.config_builder()

local dark_theme = "Ayu Mirage (Gogh)"
local light_theme = "dawnfox"
local next_theme = {
  [dark_theme] = light_theme,
  [light_theme] = dark_theme,
}

-- NOTE: Can use target triple to get OS, from OS get preferred theme.
config.color_scheme = dark_theme

config.window_background_opacity = 0.9

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
