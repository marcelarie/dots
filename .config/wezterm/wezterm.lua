local wezterm = require "wezterm"

local lighthaus_dark_colors = {
		-- The default text color
		foreground = "#FFFADE",
		-- The default background color
		background = "#000000",

		-- Overrides the cell background color when the current cell is occupied by the
		-- cursor and the cursor style is set to Block
		cursor_bg = "#47A8A1",
		-- Overrides the text color when the current cell is occupied by the cursor
		cursor_fg = "black",
		-- Specifies the border color of the cursor when the cursor style is set to Block,
		-- or the color of the vertical or horizontal bar when the cursor style is set to
		-- Bar or Underline.
		cursor_border = "#47A8A1",

		-- the foreground color of selected text
		selection_fg = "#18191E",
		-- the background color of selected text
		selection_bg = "#1D918B",

		-- The color of the scrollbar "thumb"; the portion that represents the current viewport
		scrollbar_thumb = "#222222",

		-- The color of the split lines between panes
		split = "#444444",

		ansi = {
			"#373C45",
			"#FF5050",
			"#44B273",
			"#ED722E",
			"#1D918B",
			"#D16BB7",
			"#00BFA4",
			"#8E8D8D",
		},
		brights = {
			"#CCCCCC",
			"#FF4D00",
			"#10B981",
			"#ED722E",
			"#1D918B",
			"#D68EB2",
			"#5AD1AA",
			"#FFFADE",
		},

		-- -- Arbitrary colors of the palette in the range from 16 to 255
		-- indexed = { [136] = "#FFFF00" },

		-- Since: 20220319-142410-0fcdea07
		-- When the IME, a dead key or a leader key are being processed and are effectively
		-- holding input pending the result of input composition, change the cursor
		-- to this color to give a visual cue about the compose state.
		compose_cursor = "#1D918B",
	}

local kanagawa_dragon_colors = {
		foreground = "#c5c9c5",
		-- background = "#181616",
		background = "#000000",

		cursor_bg = "#C8C093",
		cursor_fg = "#C8C093",
		cursor_border = "#C8C093",

		selection_fg = "#C8C093",
		selection_bg = "#2D4F67",

		scrollbar_thumb = "#16161D",
		split = "#16161D",

		ansi = { "#0D0C0C", "#C4746E", "#8A9A7B", "#C4B28A", "#8BA4B0", "#A292A3", "#8EA4A2", "#C8C093" },
		brights = { "#A6A69C", "#E46876", "#87A987", "#E6C384", "#7FB4CA", "#938AA9", "#7AA89F", "#C5C9C5" },
		indexed = { [16] = "#B6927B", [17] = "#B98D7B" },
}


return {
	check_for_updates = false,
	window_close_confirmation = "NeverPrompt",
	show_update_window = false,
	skip_close_confirmation_for_processes_named = {
		"bash",
		"sh",
		"zsh",
		"fish",
		"tmux",
		"nvim",
	},
	window_padding = { left = 40, right = 40, bottom = 40, top = 40 },
	audible_bell = "Disabled",
	hide_tab_bar_if_only_one_tab = true,
	window_decorations = "RESIZE",
	font = wezterm.font "JetBrainsMono Nerd Font",
	-- font = wezterm.font "VT323",
	-- font = wezterm.font "Hack Nerd Font",
	-- font = wezterm.font "Inconsolata Nerd Font Regular",
	-- font = wezterm.font "Iosevka Nerd Font Mono",
	adjust_window_size_when_changing_font_size = false,
	font_size = 14.5,
	-- font_size = 18,
	-- keys = {
	-- { key = "r", mods = "CMD|SHIFT", action = "ReloadConfiguration" },
	-- keys = {
	--     -- This will create a new split and run your default program inside it
	--     {
	--         key = "Enter",
	--         mods = "CMD",
	--         action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
	--     },
	-- },
	-- },
	-- Spawn a fish shell in login mode
	-- default_prog = { "/etc/profiles/per-user/m.manzanares/bin/fish" },
	keys = {
		{
			key = "w",
			mods = "CMD",
			action = wezterm.action.CloseCurrentPane { confirm = false },
		},
	},
	force_reverse_video_cursor = true,
	default_cursor_style = "SteadyUnderline",
	colors = kanagawa_dragon_colors,
}
