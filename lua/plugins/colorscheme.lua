local dracula = require("config.colorscheme.dracula")
local tokyonight = require("config.colorscheme.tokyonight")
local kanagawa = require("config.colorscheme.kanagawa")
local catppuccin = require("config.colorscheme.catppuccin")

return {
	-- Dracula
	{
		"Mofiqul/dracula.nvim",
		lazy = false,
		opts = dracula.opts,
		init = dracula.init,
	},

	-- Tokyonight
	{
		"folke/tokyonight.nvim",
		lazy = false,
		opts = tokyonight.opts,
		-- init = tokyonight.init,
	},

	-- kanagawa
	{
		"rebelot/kanagawa.nvim",
		opts = kanagawa.opts,
		-- init = kanagawa.init,
	},

	-- Catppuccin
	{
		"catppuccin/nvim",
		name = "catppuccin",
		opts = catppuccin.opts,
		-- init = catppuccin.init,
	},

	-- Gruvbox
	{
		"ellisonleao/gruvbox.nvim",
		opts = {},
	},

	-- Everforest
	{
		"sainnhe/everforest",
		opts = {},
	},

	-- Neosolarized
	{
		"svrana/neosolarized.nvim",
		dependencies = {
			"tjdevries/colorbuddy.nvim",
		},
		-- opts = {},
	},

	-- Nightfox
	{
		"EdenEast/nightfox.nvim",
	},

	-- Onedark
	{
		"navarasu/onedark.nvim",
	},
}
