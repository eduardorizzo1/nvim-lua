local dracula = require("config.colorscheme.dracula")
local tokyonight = require("config.colorscheme.tokyonight")
local kanagawa = require("config.colorscheme.kanagawa")
local catppuccin = require("config.colorscheme.catppuccin")
local init = dracula
-- local init = tokyonight
-- local init = kanagawa

return {
	--TEST: Dracula
	{
		"Mofiqul/dracula.nvim",
		lazy = false,
		opts = dracula.opts,
		init = init.init,
	},

	--TEST: Tokyonight
	{
		"folke/tokyonight.nvim",
		lazy = false,
		opts = tokyonight.opts,
		init = init.init,
	},

	--TEST: kanagawa
	{
		"rebelot/kanagawa.nvim",
		opts = kanagawa.opts,
		init = init.init,
	},

	--TEST: Catppuccin
	{
		"catppuccin/nvim",
		name = "catppuccin",
		opts = catppuccin.opts,
		init = init.init,
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
		"Tsuzat/NeoSolarized.nvim",
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
		opts = {},
	},
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
}
