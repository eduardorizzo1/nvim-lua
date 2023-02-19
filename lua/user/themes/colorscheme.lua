local g = vim.g
local cmd = vim.cmd
local M = {}

local dracula = {
	bg = "#282a36",
	current_line = "#44475a",
	fg = "#f8f8f2",
	comment = "#6272a4",
	cyan = "#8be9fd",
	green = "#50fa7b",
	orange = "#ffb86c",
	pink = "#ff79c6",
	purple = "#bd93f9",
	red = "#ff5555",
	yellow = "#f1fa8c",
	purple_alt = "#564f8b",
	rounded_bg = "#1f2335",
	rounded_fg = "#333952",
	darkblue = "#081633",
	violet = "#a9a1e1",
	magenta = "#c678dd",
	blue = "#51afef",
}

local catppuccin = {
	bg = "#282a36",
	current_line = "#44475a",
	fg = "#f8f8f2",
	comment = "#6272a4",
	cyan = "#8be9fd",
	green = "#50fa7b",
	orange = "#ffb86c",
	pink = "#ff79c6",
	purple = "#bd93f9",
	red = "#ff5555",
	yellow = "#f1fa8c",
	purple_alt = "#564f8b",
	rounded_bg = "#1f2335",
	rounded_fg = "#333952",
	darkblue = "#081633",
	violet = "#a9a1e1",
	magenta = "#c678dd",
	blue = "#51afef",
}

local tokyonight = {
	bg = "#282a36",
	current_line = "#44475a",
	fg = "#f8f8f2",
	comment = "#6272a4",
	cyan = "#8be9fd",
	green = "#50fa7b",
	orange = "#ffb86c",
	pink = "#ff79c6",
	purple = "#bd93f9",
	red = "#ff5555",
	yellow = "#f1fa8c",
	purple_alt = "#564f8b",
	rounded_bg = "#1f2335",
	rounded_fg = "#333952",
	darkblue = "#081633",
	violet = "#a9a1e1",
	magenta = "#c678dd",
	blue = "#51afef",
}

local mode_color = function(theme)
	return {
		n = theme.purple,
		i = theme.green,
		v = theme.pink,
		[""] = theme.pink,
		V = theme.pink,
		c = theme.magenta,
		no = theme.red,
		s = theme.orange,
		S = theme.orange,
		[""] = theme.orange,
		ic = theme.yellow,
		R = theme.red,
		Rv = theme.red,
		cv = theme.red,
		ce = theme.red,
		r = theme.cyan,
		rm = theme.cyan,
		["r?"] = theme.cyan,
		["!"] = theme.red,
		t = theme.red,
	}
end

if g.colors_name == "catppuccin" then
	M.color = catppuccin
	M.mode_color = mode_color(catppuccin)
elseif g.colors_name == "tokyonight" then
	M.color = tokyonight
	M.mode_color = mode_color(tokyonight)
else
	M.color = dracula
	M.mode_color = mode_color(dracula)
end

return M
