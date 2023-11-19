return {
	-----------------------------------
	------------[ Lspconfig ]----------
	-----------------------------------
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{ "williamboman/mason.nvim", opts = {} },
			{
				"williamboman/mason-lspconfig.nvim",
				opts = {
					ensure_installed = {},
					automatic_installation = true,
				},
			},
			{ "hrsh7th/cmp-nvim-lsp" },
			{
				"pmizio/typescript-tools.nvim",
				dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
				opts = require("config.lsp.typescript-tools").opts,
			},
		},
		opts = require("config.lsp").opts,
		config = require("config.lsp").config,
	},

	-----------------------------------
	-----------[ Signature ]-----------
	-----------------------------------
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = require("config.lsp.signature").opts,
	},

	-----------------------------------
	------------[ Saga ]---------------
	-----------------------------------
	{
		"nvimdev/lspsaga.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		opts = require("config.lsp.saga").opts,
	},

	-----------------------------------
	------------[ Null-ls ]------------
	-----------------------------------
	{
		"nvimtools/none-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "mason.nvim", "nvim-lspconfig" },
		opts = require("config.lsp.null-ls").opts,
	},
}
