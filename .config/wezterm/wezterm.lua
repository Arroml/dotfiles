local wezterm = require("wezterm")
local act = wezterm.action

return {
	-- ==============================
	-- FENSTER: KEINE TOPBAR / KEINE MACOS CONTROLS
	-- ==============================
	window_decorations = "RESIZE", -- entfernt Titlebar + macOS Buttons
	window_padding = {
		left = 6,
		right = 6,
		top = 4,
		bottom = 4,
	},
	send_composed_key_when_left_alt_is_pressed = false,
	send_composed_key_when_right_alt_is_pressed = false,
	keys = {
		-- Command+A/S/D/F/G -> Ctrl+Alt chords for tmux window navigation
		{
			key = "a",
			mods = "CMD",
			action = act.SendKey({ key = "a", mods = "CTRL|ALT" }),
		},
		{
			key = "s",
			mods = "CMD",
			action = act.SendKey({ key = "s", mods = "CTRL|ALT" }),
		},
		{
			key = "d",
			mods = "CMD",
			action = act.SendKey({ key = "d", mods = "CTRL|ALT" }),
		},
		{
			key = "f",
			mods = "CMD",
			action = act.SendKey({ key = "f", mods = "CTRL|ALT" }),
		},
		{
			key = "g",
			mods = "CMD",
			action = act.SendKey({ key = "g", mods = "CTRL|ALT" }),
		},
		-- Command+H/J/K/L -> Ctrl+Alt chords for tmux pane navigation
		{
			key = "h",
			mods = "CMD",
			action = act.SendKey({ key = "h", mods = "CTRL|ALT" }),
		},
		{
			key = "j",
			mods = "CMD",
			action = act.SendKey({ key = "j", mods = "CTRL|ALT" }),
		},
		{
			key = "k",
			mods = "CMD",
			action = act.SendKey({ key = "k", mods = "CTRL|ALT" }),
		},
		{
			key = "l",
			mods = "CMD",
			action = act.SendKey({ key = "l", mods = "CTRL|ALT" }),
		},
		{
			key = "mapped:ö",
			mods = "CMD",
			action = act.SendKey({ key = "o", mods = "CTRL|ALT" }),
		},
		{
			key = "mapped:ä",
			mods = "CMD",
			action = act.SendKey({ key = "u", mods = "CTRL|ALT" }),
		},
	},

	-- ==============================
	-- TAB BAR KOMPLETT AUS
	-- ==============================
	enable_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,

	-- ==============================
	-- GRUVBOX THEME
	-- ==============================
	color_scheme = "Gruvbox Dark (Gogh)",

	-- ==============================
	-- SCHRIFT (optional, aber empfohlen)
	-- ==============================
	font = wezterm.font_with_fallback({
		"JetBrains Mono",
		"FiraCode Nerd Font",
	}),
	font_size = 13.0,

	-- ==============================
	-- CURSOR / UI CLEANUP
	-- ==============================
	cursor_blink_rate = 0,
	use_fancy_tab_bar = false,

	-- ==============================
	-- PERFORMANCE
	-- ==============================
	front_end = "WebGpu",
	animation_fps = 60,
	max_fps = 120,

	-- ==============================
	-- KEIN FENSTER-TITEL-UPDATE
	-- ==============================
	window_close_confirmation = "NeverPrompt",
}
