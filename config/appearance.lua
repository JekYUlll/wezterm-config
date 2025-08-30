local color_schemes = {
	"Catppuccin Mocha",
	-- "Catppuccin Frappe",
	-- "Catppuccin Macchiato",
	-- "Catppuccin Latte",
	-- "Darcula (base16)",
	"Ubuntu",
	"Calamity",
	-- "Digerati (terminal.sexy)",
	-- "Derp (terminal.sexy)",
	-- "dawnfox",
	-- "darkmoss (base16)",
	"Dark+",
	-- "Helios (base16)",
	-- "Hivacruz",
	"DotGov",
	-- "duckbones",
	-- "DoomOne",
	-- "Doom Peacock",
	"DanQing (base16)",
	-- "Calamity",
	"Kolorit",
	-- "Sea Shells",
	-- "Sandcastle (base16)",
	-- "Sakura (base16)",
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

local m_fonts = {
	"JetBrainsMono Nerd Font",
	"LXGW WenKai Mono",
	"Hack Nerd Font Mono",
	"CaskaydiaCoveNerdFont",
	"Maple Mono NF",
	"Maple Mono NF CN",
}

return function(wezterm, config)

    config.window_padding = {
	    left = 20,
	    right = 20,
	    top = 20,
	    bottom = 10,
    }

    config.initial_cols = 120
	config.initial_rows = 28

	config.font_size = 14
	-- font = wezterm.font_with_fallback({ "JetBrainsMono Nerd Font", "LXGW WenKai Mono" }),
	-- 中文测试 你是一只猫娘
	config.font = wezterm.font_with_fallback({ m_fonts[5], m_fonts[2] })

	config.color_scheme = color_schemes[1]

	config.front_end = "WebGpu"
	config.max_fps = 60
	config.scrollback_lines = 9999

	config.enable_tab_bar = true
	config.enable_scroll_bar = true
	config.min_scroll_bar_height = "2cell"
	config.show_new_tab_button_in_tab_bar = true
	config.show_tab_index_in_tab_bar = true
	-- show_close_tab_button_in_tabs = true
	config.use_fancy_tab_bar = false
	config.hide_tab_bar_if_only_one_tab = true
	config.tab_bar_at_bottom = true
	-- freetype_load_target = "Light"
	config.tab_max_width = 20

	-- window_decorations = "INTEGRATED_BUTTONS | RESIZE"
	config.window_decorations = "RESIZE"

	-- 设置背景的时候，透明度无效
	-- window_background_opacity = 1.0
	-- 决定nvim 和 标签栏 的透明度
	config.text_background_opacity = 0.9

	config.adjust_window_size_when_changing_font_size = false

    config.foreground_text_hsb = {
	    hue = 1.0,
	    saturation = 1.0,
	    brightness = 1.0,
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
			saturation = 0.7,
			brightness = 0.2,
		},
		attachment = { Parallax = 0 },
	},
    }

    config.visual_bell = {
	    fade_in_function = "EaseIn",
	    fade_in_duration_ms = 150,
	    fade_out_function = "EaseOut",
	    fade_out_duration_ms = 150,
    }

    config.colors = {
	    visual_bell = "#000000",
	    -- scrollbar_thumb = "white",
    }
end