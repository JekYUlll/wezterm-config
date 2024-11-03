local wezterm = require("wezterm")
-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
-- if wezterm.config_builder then
-- 	config = wezterm.config_builder()
-- end

local color_schemes = {
	"Catppuccin Mocha",
	"Catppuccin Frappe",
	"Catppuccin Macchiato",
	"Catppuccin Latte",
	"Darcula (base16)",
	"Ubuntu",
	"Calamity",
	"DanQing (base16)",
	"Calamity",
	-- "Chalk",
	-- "Chester",
	-- "darkmatrix",
	-- "Circus (base16)",
	-- "darkmoss (base16)",
	-- "Ef-Cherie",
	-- "dawnfox",
	-- "Vacuous 2 (terminal.sexy)",
	-- "Vaughn",
	-- "Violet Dark",
	-- "VisiBlue (terminal.sexy)",
	-- "Tinacious Design (Dark)",
}

-- local m_fonts = {
-- 	"JetBrainsMono Nerd	Font",
-- 	"LXGW WenKai Mono",
-- 	"UbuntuMono Nerd Font",
-- 	"Hack Nerd Font Mono",
-- }

local config = {

	font_size = 14,
	font = wezterm.font_with_fallback({ "JetBrainsMono Nerd Font", "LXGW WenKai Mono" }),

	color_scheme = color_schemes[1],

	front_end = "WebGpu",
	max_fps = 60,
	scrollback_lines = 9999,

	enable_tab_bar = true,
	enable_scroll_bar = true,
	min_scroll_bar_height = "2cell",
	show_new_tab_button_in_tab_bar = true,
	show_tab_index_in_tab_bar = true,
	-- show_close_tab_button_in_tabs = true,
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	tab_bar_at_bottom = true,
	-- freetype_load_target = "Light",
	tab_max_width = 20,

	-- window_decorations = "INTEGRATED_BUTTONS | RESIZE",
	window_decorations = "RESIZE",

	-- window_background_opacity = 1.0,
	text_background_opacity = 0.8,

	adjust_window_size_when_changing_font_size = false,
}

config.window_padding = {
	left = 20,
	right = 20,
	top = 20,
	bottom = 10,
}

config.background = {
	{
		source = {
			-- File = "/home/horeb/Pictures/WallPaper/wallhaven-eymm6l.jpg",
			File = "/home/horeb/Pictures/WallPaper/wallhaven-x1qq3v.png",
		},
		-- width = "100%",
		repeat_x = "NoRepeat",
		repeat_y = "NoRepeat",
		vertical_align = "Top",
		horizontal_align = "Left",
		-- hsb = dimmer,
		hsb = {
			hue = 1.0,
			saturation = 0.8,
			brightness = 0.4,
		},
		attachment = { Parallax = 0 },
	},
}

-- 启动时调整窗口位置
wezterm.on("window-config-reloaded", function(window, pane)
	local id = tostring(window:window_id())
	local seen = wezterm.GLOBAL.seen_windows or {}
	local is_new_window = not seen[id]
	seen[id] = true
	wezterm.GLOBAL.seen_windows = seen
	if is_new_window then
		window:set_position(640, 400)
	end
end)

config.mouse_bindings = {
	-- -- Change the default click behavior so that it only selects
	--    {
	--        event = {
	--            Up = {
	--                streak = 1,
	--                button = 'Left'
	--             }
	--         },
	--        mods = 'NONE',
	--        action = wezterm.action {
	--            CompleteSelection = 'PrimarySelection'
	--         }
	--    },

	-- CTRL-Click open hyperlinks
	{
		event = {
			Up = {
				streak = 1,
				button = "Left",
			},
		},
		mods = "CTRL",
		action = "OpenLinkAtMouseCursor",
	},
}

config.keys = {
	-- 使用 Ctrl+n 来新建标签页，而不是 Ctrl+Shift+T
	-- { key = "n", mods = "ALT", action = wezterm.action({ SpawnTab = "DefaultDomain" }) },
	-- 使用 Alt+左右箭头来切换标签页
	-- { key = "LeftArrow", mods = "ALT", action = wezterm.action({ ActivateTabRelative = -1 }) },
	-- { key = "RightArrow", mods = "ALT", action = wezterm.action({ ActivateTabRelative = 1 }) },
}

config.visual_bell = {
	fade_in_function = "EaseIn",
	fade_in_duration_ms = 150,
	fade_out_function = "EaseOut",
	fade_out_duration_ms = 150,
}

config.colors = {
	visual_bell = "#202020",
	-- scrollbar_thumb = "white",
}

config.foreground_text_hsb = {
	hue = 1.0,
	saturation = 1.0,
	brightness = 1.0,
}

return config
