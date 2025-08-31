return function(wezterm, config)
	local color_schemes = {
		"Catppuccin Mocha",
		-- "Catppuccin Frappe",
		-- "Catppuccin Macchiato",
		-- "Catppuccin Latte",
		'AdventureTime',
		-- "Darcula (base16)",
		"Ubuntu",
		"Calamity",
		"flexoki",
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

	config.window_padding = {
		left = 20,
		right = 20,
		top = 20,
		bottom = 10,
	}

	config.initial_cols = 120
	config.initial_rows = 28

	config.font_size = 14
	-- 中文测试 你是一只猫娘
	config.font = wezterm.font_with_fallback({ m_fonts[1], m_fonts[2] })

	config.color_scheme = color_schemes[1]

	-- config.default_cursor_style = "BlinkingBar"

	config.front_end = "WebGpu"
	config.max_fps = 60
	config.scrollback_lines = 9999

	-- config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
	config.window_decorations = "RESIZE"

	-- 设置背景的时候，透明度无效
	-- config.window_background_opacity = 0.6
	-- 决定nvim 和 标签栏 的透明度
	config.text_background_opacity = 0.9

	config.adjust_window_size_when_changing_font_size = false

	config.foreground_text_hsb = {
		hue = 1.0,
		saturation = 1.0,
		brightness = 1.0,
	}

	-- config.window_background_image = '/home/horeb/Pictures/WallPaper/wallhaven-eymm6l.jpg'

	config.background = {
		{
			source = {
				-- File = "images/wallhaven-eymm6l.jpg",
				File = '/home/horeb/Pictures/WallPaper/wallhaven-eymm6l.jpg',
				-- File = "/home/horeb/Pictures/WallPaper/wallhaven-x1qq3v.png",
			},
			-- width = "100%",
			repeat_x = "NoRepeat",
			repeat_y = "NoRepeat",
			vertical_align = "Top",
			horizontal_align = "Left",
			-- hsb = dimmer,
			hsb = {
				hue = 1.0,
				saturation = 0.6,
				brightness = 0.7,
			},
			attachment = { Parallax = 0 },
			opacity = 0.96,
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

	config.detect_password_input = true

	-- config.default_prog = { 'top' }
end
