return function(wezterm, config)

	config.enable_tab_bar = true
	config.enable_scroll_bar = true
	config.min_scroll_bar_height = "2cell"
	config.show_new_tab_button_in_tab_bar = true
	config.show_tab_index_in_tab_bar = true
	-- config.show_close_tab_button_in_tabs = false
	config.use_fancy_tab_bar = false
	config.hide_tab_bar_if_only_one_tab = true
	config.tab_bar_at_bottom = true
	config.tab_and_split_indices_are_zero_based = true
	-- freetype_load_target = "Light"
	config.tab_max_width = 20

	-- local emojis = {
	-- 		"🤗",
	-- 		"⛩️",
	-- 		"🪭",
	-- 		"🏴‍☠️",
	-- 		"☠️",
	-- 		"🤖",
	-- 		"👺",
	-- 		"⚙️",
	-- 		"👾",
	-- 		"🎮",
	-- 		"🎲",
	-- 		"🃏",
	-- 		"🕹️",
	-- }

	-- local scheme = wezterm.color.get_builtin_schemes()['Catppuccin Mocha']
	-- local theme_bg = scheme.background

	-- local GLYPH_SEMI_CIRCLE_LEFT = ""
	-- local GLYPH_SEMI_CIRCLE_RIGHT = ""

	-- local colors = {
	-- 	default = { bg = "#45475a", fg = "#cdd6f4" },
	-- 	is_active = { bg = "#45475a", fg = "#f5e0dc" },
	-- 	hover = { bg = "#f5e0d", fg = "#1e1e2e" },
	-- }

	-- local cells = {}
	-- local function push(bg, fg, attribute, text)
	-- 	table.insert(cells, { Background = { Color = bg } })
	-- 	table.insert(cells, { Foreground = { Color = fg } })
	-- 	table.insert(cells, { Attribute = attribute })
	-- 	table.insert(cells, { Text = text })
	-- end

	-- wezterm.on("format-tab-title", function(tab, tabs, panes, _config, hover, max_width)
	-- 	cells = {}

	-- 	local bg, fg
	-- 	if tab.is_active then
	-- 		bg, fg = colors.is_active.bg, colors.is_active.fg
	-- 	elseif hover then
	-- 		bg, fg = colors.hover.bg, colors.hover.fg
	-- 	else
	-- 		bg, fg = colors.default.bg, colors.default.fg
	-- 	end

	-- 	local title = tab.active_pane.title
	-- 	if #title > max_width - 6 then
	-- 		title = wezterm.truncate_right(title, max_width - 6)
	-- 	end

		
	-- 	local padding = emojis[9]
	-- 	local top_bottom_pad = ""

	-- 	push(theme_bg, bg, { Intensity = "Bold" }, top_bottom_pad .. GLYPH_SEMI_CIRCLE_LEFT)
	-- 	push(bg, fg, { Intensity = "Bold" }, padding .. title)
	-- 	-- push(bg, fg, { Intensity = "Bold" }, padding .. title .. padding)
	-- 	push(theme_bg, bg, { Intensity = "Bold" }, GLYPH_SEMI_CIRCLE_RIGHT)

	-- 	return cells
	-- end)
end