local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

local config = {}

-- Apply default configuration
config = wezterm.config_builder()

--  Key configuraion
config.leader = { key = "b", mods = "CMD", timeout_milliseconds = 2000 }
config.keys = {
	-- Terminal
	{
		key = "LeftArrow",
		mods = "CMD",
		action = act({ SendString = "\x1bOH" }),
	},
	{
		key = "RightArrow",
		mods = "CMD",
		action = act({ SendString = "\x1bOF" }),
	},
	{
		key = "LeftArrow",
		mods = "OPT",
		action = act({ SendString = "\x1bb" }),
	},
	{
		key = "RightArrow",
		mods = "OPT",
		action = act({ SendString = "\x1bf" }),
	},
	{ key = "Backspace", mods = "CMD", action = act.SendString("\x15") },

	-- Pane
	{ key = "x", mods = "CMD", action = act.CloseCurrentPane({ confirm = false }) },
	{ key = "D", mods = "SHIFT|CMD", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "d", mods = "CMD", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "j", mods = "CMD", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "CMD", action = act.ActivatePaneDirection("Up") },
	{ key = "h", mods = "CMD", action = act.ActivatePaneDirection("Left") },
	{ key = "l", mods = "CMD", action = act.ActivatePaneDirection("Right") },
	{ key = "j", mods = "CMD|ALT", action = act.AdjustPaneSize({ "Down", 5 }) },
	{ key = "k", mods = "CMD|ALT", action = act.AdjustPaneSize({ "Up", 5 }) },
	{ key = "h", mods = "CMD|ALT", action = act.AdjustPaneSize({ "Left", 5 }) },
	{ key = "l", mods = "CMD|ALT", action = act.AdjustPaneSize({ "Right", 5 }) },

	--  Tab
	{ key = "t", mods = "CMD", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "w", mods = "CMD", action = act.CloseCurrentTab({ confirm = false }) },

	--  Window
	{ key = "N", mods = "SHIFT|CMD", action = act.SpawnWindow },
}

config.color_scheme = "tokyonight"
config.font = wezterm.font("JetBrains Mono")
config.window_background_opacity = 0.9
config.inactive_pane_hsb = {
	saturation = 0.3,
	brightness = 0.3,
	hue = 1,
}

-- Startup configuration
wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

return config
