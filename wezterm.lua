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
-- config.default_prog = { 'vim' }
config.automatically_reload_config = true

return config
