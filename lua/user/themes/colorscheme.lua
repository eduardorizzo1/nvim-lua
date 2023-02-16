local g = vim.g
local M = {}

local color = {
	dracula = {
		bg = "none",
		rounded_bg = "#1f2335",
		rounded_fg = "#333952",
		fg = "#f8f8f2",
		yellow = "#f1fa8c",
		cyan = "#8be9fd",
		darkblue = "#081633",
		green = "#50fa7b",
		orange = "#ffb86c",
		violet = "#a9a1e1",
		magenta = "#c678dd",
		pink = "#ff79c6",
		purple = "#bd93f9",
		blue = "#51afef",
		red = "#ec5f67",
	},
}

local mode_color = {
	dracula = {
		n = color.dracula.purple,
		i = color.dracula.green,
		v = color.dracula.pink,
		[""] = color.dracula.pink,
		V = color.dracula.pink,
		c = color.dracula.magenta,
		no = color.dracula.red,
		s = color.dracula.orange,
		S = color.dracula.orange,
		[""] = color.dracula.orange,
		ic = color.dracula.yellow,
		R = color.dracula.red,
		Rv = color.dracula.red,
		cv = color.dracula.red,
		ce = color.dracula.red,
		r = color.dracula.cyan,
		rm = color.dracula.cyan,
		["r?"] = color.dracula.cyan,
		["!"] = color.dracula.red,
		t = color.dracula.red,
	},
}

if g.colors_name == "dracula" then
	M.color = color.dracula
	M.mode_color = mode_color.dracula
end

return M
