local dracula = require("config.themes.dracula")
local tokyonight = require("config.themes.tokyonight")
local kanagawa = require("config.themes.kanagawa")
local catppuccin = require("config.themes.catppuccin")

return {
	{
		"Mofiqul/dracula.nvim",
		lazy = false,
		opts = dracula.opts,
		init = dracula.init,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		opts = tokyonight.opts,
		-- init = tokyonight.init,
	},
	{
		"rebelot/kanagawa.nvim",
		opts = kanagawa.opts,
		-- init = kanagawa.init,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		opts = catppuccin.opts,
		-- init = catppuccin.init,
	},
}
