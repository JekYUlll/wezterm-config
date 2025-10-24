return function(wezterm, config)
	-- local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
	-- bar.apply_to_config(config)

	local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
	local tabline_themes = {
		-- 想让tab有区分度，必须选择def和40m颜色不一样的主题。主色为44m
		"Yousai (terminal.sexy)", -- 白蓝色清新塑料，挺好看的
		"kanagawabones",
		"Kanagawa (Gogh)",
		"iceberg-dark",
		"Wzoreck (Gogh)",
		"tokyonight",
		"Tokyo Night Light (Gogh)",
		"Dimmed Monokai (Gogh)",
		"Duotone Dark",
		-- "DimmedMonokai",
		-- "Colorcli (Gogh)",
		-- "Crayon Pony Fish (Gogh)",
		"Count Von Count (terminal.sexy)",
		-- "Codeschool (light) (terminal.sexy)",
		"Cloud (terminal.sexy)",
		"Grape",
		"Hybrid",
		-- "Glacier",
		"duskfox",
		"Geohot (Gogh)",
		"Kasugano (terminal.sexy)",
		"Catppuccin Mocha",
		"flexoki",
		-- "Insignificato (terminal.sexy)",
		-- "Digerati (terminal.sexy)",
	}
	-- wezterm内置的符号列表：https://wezterm.org/config/lua/wezterm/nerdfonts.html
	local dividers = {
		"",
		"",
		"",
		"",
		"",
		"",
		"",
		"",
		"",
		"█▓▒░",
	}
	tabline.setup({
		options = {
			icons_enabled = true,
			theme = tabline_themes[3],
			tabs_enabled = true,
			-- theme_overrides = {
			-- 	-- Default colors from Catppuccin Mocha
			-- 	normal_mode = {
			-- 		-- a = { fg = '#181825', bg = '#89b4fa' },
			-- 		-- b = { fg = '#89b4fa', bg = '#313244' },
			-- 		-- c = { fg = '#cdd6f4', bg = '#181825' },
			-- 		-- a = { fg = '#181825', bg = '#89b4fa' },
			-- 		b = { bg = "#313244" },
			-- 	},
			-- 	-- copy_mode = {
			-- 	--     a = { fg = '#181825', bg = '#f9e2af' },
			-- 	--     b = { fg = '#f9e2af', bg = '#313244' },
			-- 	--     c = { fg = '#cdd6f4', bg = '#181825' },
			-- 	-- },
			-- 	-- search_mode = {
			-- 	--     a = { fg = '#181825', bg = '#a6e3a1' },
			-- 	--     b = { fg = '#a6e3a1', bg = '#313244' },
			-- 	--     c = { fg = '#cdd6f4', bg = '#181825' },
			-- 	-- },
			-- 	-- Defining colors for a new key table
			-- 	-- window_mode = {
			-- 	--     a = { fg = '#181825', bg = '#cba6f7' },
			-- 	--     b = { fg = '#cba6f7', bg = '#313244' },
			-- 	--     c = { fg = '#cdd6f4', bg = '#181825' },
			-- 	-- },
			-- 	-- Default tab colors
			-- 	tab = {
			-- 		active = { fg = "FFEDEDED", bg = "#313244" },
			-- 		-- active = { fg = '#89b4fa', bg = '#313244' },
			-- 		-- inactive = { fg = '#cdd6f4', bg = '#181825' },
			-- 		inactive_hover = { fg = "#f5c2e7", bg = "#313244" },
			-- 	},
			-- },
			section_separators = {
				-- left = wezterm.nerdfonts.pl_left_hard_divider,
				left = "",
				right = wezterm.nerdfonts.pl_right_hard_divider,
			},
			component_separators = {
				left = wezterm.nerdfonts.pl_left_soft_divider,
				right = wezterm.nerdfonts.pl_right_soft_divider,
			},
			tab_separators = {
				left = "",
				right = "",
				-- left = wezterm.nerdfonts.pl_left_hard_divider,
				-- right = wezterm.nerdfonts.pl_right_hard_divider
			},
		},
		sections = {
			tabline_a = { "mode" },
			tabline_b = { "workspace" },
			tabline_c = { " " },
			tab_active = {
				"index",
				{ "parent", padding = 0 },
				"/",
				{ "cwd", padding = { left = 0, right = 1 } },
				{ "zoomed", padding = 0 },
			},
			tab_inactive = {
				"index",
				{ "process", padding = { left = 0, right = 1 } },
			},
			tabline_x = { "ram", "cpu" },
			tabline_y = { "datetime", "battery" },
			tabline_z = { "domain" },
		},
		extensions = {
			-- 'resurrect',
			-- 'smart_workspace_switcher',
			-- 'quick_domains',
			-- 'presentation',
		},
	})

	tabline.apply_to_config(config)

	-- 插件覆盖了部分设置，此处再次设置
	config.window_padding = {
		left = 10,
		right = 0,
		top = 0,
		bottom = 10,
	}

	-- local session_manager = wezterm.plugin.require("https://github.com/danielcopper/wezterm-session-manager")
	-- session_manager.apply_to_config(config)
	local session_manager = require("plugins/wezterm-session-manager/session-manager")
	wezterm.on("save_session", function(window)
		session_manager.save_state(window)
	end)
	wezterm.on("load_session", function(window)
		session_manager.load_state(window)
	end)
	wezterm.on("restore_session", function(window)
		session_manager.restore_state(window)
	end)

	config.keys = {
		{ key = "S", mods = "LEADER", action = wezterm.action({ EmitEvent = "save_session" }) },
		{ key = "L", mods = "LEADER", action = wezterm.action({ EmitEvent = "load_session" }) },
		{ key = "R", mods = "LEADER", action = wezterm.action({ EmitEvent = "restore_session" }) },
	}
end
