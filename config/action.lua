return function(wezterm, config)
	config.window_close_confirmation = "NeverPrompt"

	-- config.default_prog = { "/usr/bin/tmux", "new-session", "-A", "-s", "main" }

	local act = wezterm.action

	local function is_shell(foreground_process_name)
		local shell_names = { "bash", "zsh", "fish", "sh", "ksh", "dash" }
		local process = string.match(foreground_process_name, "[^/\\]+$") or foreground_process_name
		for _, shell in ipairs(shell_names) do
			if process == shell then
				return true
			end
		end
		return false
	end

	-- 第一个tab打开tmux，之后的为空的shell
	local tmux_started = false
	wezterm.on("gui-startup", function(cmd)
		-- 启动 wezterm 时自动打开一个 window
		local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
		if not tmux_started then
			tmux_started = true
			-- 启动 tmux
			pane:send_text("tmux -u new-session -A -s main\n")
		end
	end)

	-- 启动时调整窗口位置，置中
	wezterm.on("window-config-reloaded", function(window, pane)
		local id = tostring(window:window_id())
		local seen = wezterm.GLOBAL.seen_windows or {}
		local is_new_window = not seen[id]
		seen[id] = true
		wezterm.GLOBAL.seen_windows = seen
		if is_new_window then
			window:set_position(1000, 400)
		end
	end)

	wezterm.on("open-uri", function(window, pane, uri)
		local editor = "nvim"

		if uri:find("^file:") == 1 and not pane:is_alt_screen_active() then
			-- We're processing an hyperlink and the uri format should be: file://[HOSTNAME]/PATH[#linenr]
			-- Also the pane is not in an alternate screen (an editor, less, etc)
			local url = wezterm.url.parse(uri)
			if is_shell(pane:get_foreground_process_name()) then
				-- A shell has been detected. Wezterm can check the file type directly
				-- figure out what kind of file we're dealing with
				local success, stdout, _ = wezterm.run_child_process({
					"file",
					"--brief",
					"--mime-type",
					url.file_path,
				})
				if success then
					if stdout:find("directory") then
						pane:send_text(wezterm.shell_join_args({
							"cd",
							url.file_path,
						}) .. "\r")
						pane:send_text(wezterm.shell_join_args({
							-- eza / lsd 等现代 ls 不支持 -p 参数，因此移除
							-- 'ls', '-a', '-p', '--group-directories-first'
							"ls",
							"-a",
							"--group-directories-first",
						}) .. "\r")
						return false
					end

					if stdout:find("text") then
						if url.fragment then
							pane:send_text(wezterm.shell_join_args({
								editor,
								"+" .. url.fragment,
								url.file_path,
							}) .. "\r")
						else
							pane:send_text(wezterm.shell_join_args({ editor, url.file_path }) .. "\r")
						end
						return false
					end
				end
			else
				-- No shell detected, we're probably connected with SSH, use fallback command
				local edit_cmd = url.fragment and editor .. " +" .. url.fragment .. ' "$_f"' or editor .. ' "$_f"'
				local cmd = '_f="'
					.. url.file_path
					.. '"; { test -d "$_f" && { cd "$_f" ; ls -a -p --hyperlink --group-directories-first; }; } '
					.. '|| { test "$(file --brief --mime-type "$_f" | cut -d/ -f1 || true)" = "text" && '
					.. edit_cmd
					.. "; }; echo"
				pane:send_text(cmd .. "\r")
				return false
			end
		end

		-- without a return value, we allow default actions
	end)
end
