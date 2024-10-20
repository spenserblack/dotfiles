local wezterm = require("wezterm")

local config = wezterm.config_builder()

local dark_theme = "Ayu Mirage (Gogh)"
local light_theme = "Github (base16)"
local appearance_themes = {
  Light = light_theme,
  Dark = dark_theme,
}
local next_theme = {
  [dark_theme] = light_theme,
  [light_theme] = dark_theme,
}

local appearance = wezterm.gui.get_appearance()
config.color_scheme = appearance_themes[appearance] or dark_theme

config.window_background_opacity = 0.85

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
