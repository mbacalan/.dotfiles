-- Pull in the wezterm API
local wezterm = require 'wezterm'

local function get_domain_name(tab)
  local domain = tab.active_pane.domain_name
  if domain == "local" then
    return ""
  end
  return "[" .. domain .. "] "
end

-- Events
wezterm.on("format-tab-title", function(tab)
  local title = get_domain_name(tab)
  title = title .. tab.active_pane.title

  return {
    { Text = " " .. title .. " " },
  }
end)

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.color_scheme = 'Tokyo Night'
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.font = wezterm.font_with_fallback {
  'Cascadia Code NF', 'Segoe UI Emoji'
}
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

config.max_fps = 120
config.front_end = 'WebGpu'

-- and finally, return the configuration to wezterm
return config
