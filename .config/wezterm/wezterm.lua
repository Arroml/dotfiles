local wezterm = require("wezterm")
local act = wezterm.action

return {
	-- ==============================
	-- FENSTER: KEINE TOPBAR / KEINE MACOS CONTROLS
	-- ==============================
	window_decorations = "RESIZE", -- entfernt Titlebar + macOS Buttons
	window_padding = {
		left = 15,
		right = 15,
		top = 4,
		bottom = 4,
	},
	keys = {
		{ key = "a", mods = "CMD", action = act.SendKey({ key = "a", mods = "CTRL|ALT" }) },
		{ key = "s", mods = "CMD", action = act.SendKey({ key = "s", mods = "CTRL|ALT" }) },
		{ key = "d", mods = "CMD", action = act.SendKey({ key = "d", mods = "CTRL|ALT" }) },
		{ key = "f", mods = "CMD", action = act.SendKey({ key = "f", mods = "CTRL|ALT" }) },
		{ key = "g", mods = "CMD", action = act.SendKey({ key = "g", mods = "CTRL|ALT" }) },
		{ key = "k", mods = "CMD", action = act.SendKey({ key = "k", mods = "CTRL|ALT" }) },
		{ key = "l", mods = "CMD", action = act.SendKey({ key = "l", mods = "CTRL|ALT" }) },
		{ key = "r", mods = "CMD", action = act.SendKey({ key = "r", mods = "CTRL|ALT" }) },
		{ key = "t", mods = "CMD", action = act.SendKey({ key = "t", mods = "CTRL|ALT" }) },
		{ key = "y", mods = "CMD", action = act.SendKey({ key = "y", mods = "CTRL|ALT" }) },
		{ key = "h", mods = "CMD", action = act.SendKey({ key = "h", mods = "CTRL|ALT" }) },
		{ key = "j", mods = "CMD", action = act.SendKey({ key = "j", mods = "CTRL|ALT" }) },
		{ key = "z", mods = "CMD", action = act.SendKey({ key = "_", mods = "CTRL" }) },
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
	window_close_confirmation = "AlwaysPrompt",
}
