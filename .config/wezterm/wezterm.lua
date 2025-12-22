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
	keys = {
		-- Command+A → Meta+A (Alt+A)
		{
			key = "a",
			mods = "CMD",
			action = act.SendKey({ key = "a", mods = "ALT" }),
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
