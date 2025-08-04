-- Pull in the wezterm API
local wezterm = require("wezterm")
wezterm.log_info("wezterm.lua is loaded successfulyQ")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
	config:set_strict_mode(true)
end

-- This is where you actually apply your config choices

config.keys = {
	-- This will create a new split and run your default program inside it
	{
		key = "-",
		mods = "SHIFT|ALT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
}
config.keys = {
	-- This will create a new split and run your default program inside it
	{
		key = "+",
		mods = "SHIFT|ALT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
}
config.color_scheme = "Solarized (dark) (terminal.sexy)"

return config

