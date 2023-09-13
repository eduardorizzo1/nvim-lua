local dracula = require("config.colorscheme.dracula")
local tokyonight = require("config.colorscheme.tokyonight")
local kanagawa = require("config.colorscheme.kanagawa")
local catppuccin = require("config.colorscheme.catppuccin")

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
	{
		"ellisonleao/gruvbox.nvim",
		opts = {},
	},
	{
		"sainnhe/everforest",
		opts = {},
	},
	{
		"svrana/neosolarized.nvim",
		dependencies = {
			"tjdevries/colorbuddy.nvim",
		},
		-- opts = {},
	},
}
