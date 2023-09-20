local dracula = require("config.colorscheme.dracula")
local tokyonight = require("config.colorscheme.tokyonight")
local kanagawa = require("config.colorscheme.kanagawa")
local catppuccin = require("config.colorscheme.catppuccin")

return {
	--TEST: Dracula
	{
		"Mofiqul/dracula.nvim",
		lazy = false,
		opts = dracula.opts,
		init = dracula.init,
	},

	--TEST: Tokyonight
	{
		"folke/tokyonight.nvim",
		lazy = false,
		opts = tokyonight.opts,
		-- init = tokyonight.init,
	},

	--TEST: kanagawa
	{
		"rebelot/kanagawa.nvim",
		opts = kanagawa.opts,
		-- init = kanagawa.init,
	},

	--TEST: Catppuccin
	{
		"catppuccin/nvim",
		name = "catppuccin",
		opts = catppuccin.opts,
		-- init = catppuccin.init,
	},

	--TEST: Gruvbox
	{
		"ellisonleao/gruvbox.nvim",
		opts = {},
	},

	--TEST: Everforest
	{
		"sainnhe/everforest",
		opts = {},
	},

	--TEST: Neosolarized
	{
		"svrana/neosolarized.nvim",
		dependencies = {
			"tjdevries/colorbuddy.nvim",
		},
		-- opts = {},
	},

	--TEST: Nightfox
	{
		"EdenEast/nightfox.nvim",
	},

	--TEST: Onedark
	{
		"navarasu/onedark.nvim",
		opts = {
			style = "dark", -- dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
		},
	},
	--TEST: Material
	{
		"marko-cerovac/material.nvim",
	},
}
