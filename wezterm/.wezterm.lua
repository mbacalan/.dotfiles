-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.color_scheme = 'Tokyo Night'
config.use_fancy_tab_bar = true
config.window_decorations = "RESIZE"
config.font = wezterm.font 'Cascadia Code NF'
config.font_size = 13

config.ssh_domains = {
  {
    name = 'SSH Optiplex',
    remote_address = '192.168.178.250',
    username = 'mbacalan',
    multiplexing = 'None'
  },
  {
    name = 'SSH OVH VPS',
    remote_address = '135.125.183.175:62040',
    username = 'ubuntu',
    multiplexing = 'None'
  }
}

-- and finally, return the configuration to wezterm
return config
