local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

local config = {}

-- Apply default configuration
config = wezterm.config_builder()

--  Key configuraio
config.keys = {
	-- Pane
	{ key = "x", mods = "CMD", action = act.CloseCurrentPane({ confirm = false }) },
	{ key = "D", mods = "SHIFT|CMD", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "d", mods = "CMD", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "j", mods = "CMD", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "CMD", action = act.ActivatePaneDirection("Up") },
	{ key = "h", mods = "CMD", action = act.ActivatePaneDirection("Left") },
	{ key = "l", mods = "CMD", action = act.ActivatePaneDirection("Right") },

	--  Tab
	{ key = "t", mods = "CMD", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "w", mods = "CMD", action = act.CloseCurrentTab({ confirm = false }) },

	--  Window
	{ key = "N", mods = "SHIFT|CMD", action = act.SpawnWindow },
}

config.color_scheme = "tokyonight"
config.font = wezterm.font("JetBrains Mono")
config.window_background_opacity = 0.9

-- Startup configuration
wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

return config
