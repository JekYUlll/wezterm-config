local wezterm = require("wezterm")
-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
-- if wezterm.config_builder then
-- 	config = wezterm.config_builder()
-- end

local config = wezterm.config_builder()

require("config.keybings")(wezterm, config)
require("config.appearance")(wezterm, config)
require("config.tabs")(wezterm, config)
require("config.status")(wezterm, config)
require("config.action")(wezterm, config)
require("config.plugins")(wezterm, config)
require("config.platform")(wezterm, config)

-- config.default_cwd = "/some/path"

-- 启动时调整窗口位置，置中
wezterm.on("window-config-reloaded", function(window, pane)
	local id = tostring(window:window_id())
	local seen = wezterm.GLOBAL.seen_windows or {}
	local is_new_window = not seen[id]
	seen[id] = true
	wezterm.GLOBAL.seen_windows = seen
	if is_new_window then
		window:set_position(800, 480)
	end
end)

return config
