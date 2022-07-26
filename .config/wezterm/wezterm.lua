local wezterm = require("wezterm")

return {
	check_for_updates = false,
	show_update_window = false,
	window_close_confirmation = "NeverPrompt",
	skip_close_confirmation_for_processes_named = { "bash", "sh", "zsh", "fish", "tmux", "nvim" },
	window_padding = { left = 40, right = 40, bottom = 40, top = 40 },
	audible_bell = "Disabled",
	hide_tab_bar_if_only_one_tab = true,
	window_decorations = "RESIZE",
	font = wezterm.font("JetBrains Mono"),
	adjust_window_size_when_changing_font_size = false,
	-- font_size = 16,
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

	colors = {
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

		ansi = { "#373C45", "#FF5050", "#44B273", "#ED722E", "#1D918B", "#D16BB7", "#00BFA4", "#8E8D8D" },
		brights = { "#CCCCCC", "#FF4D00", "#10B981", "#ED722E", "#1D918B", "#D68EB2", "#5AD1AA", "#FFFADE" },

		-- -- Arbitrary colors of the palette in the range from 16 to 255
		-- indexed = { [136] = "#FFFF00" },

		-- Since: 20220319-142410-0fcdea07
		-- When the IME, a dead key or a leader key are being processed and are effectively
		-- holding input pending the result of input composition, change the cursor
		-- to this color to give a visual cue about the compose state.
		compose_cursor = "#1D918B",
	},
}
