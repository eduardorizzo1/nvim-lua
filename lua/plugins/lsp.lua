return {
	--NOTE:---------------------------------
	--NOTE:----------[ Lspconfig ]----------
	--NOTE:---------------------------------
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{
				"pmizio/typescript-tools.nvim",
				dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
				opts = require("config.lsp.typescript-tools").opts,
			},
			{ "hrsh7th/cmp-nvim-lsp" },
		},
		opts = require("config.lsp").opts,
		config = require("config.lsp").config,
	},

	--NOTE:---------------------------------
	--NOTE:---------[ Signature ]-----------
	--NOTE:---------------------------------
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = require("config.lsp.signature").opts,
	},

	--NOTE:---------------------------------
	--NOTE:----------[ Saga ]---------------
	--NOTE:---------------------------------
	{
		"nvimdev/lspsaga.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		opts = require("config.lsp.saga").opts,
	},

	--NOTE:---------------------------------
	--NOTE:----------[ None-ls ]------------
	--NOTE:---------------------------------
	{
		"nvimtools/none-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "mason.nvim", "nvim-lspconfig" },
		opts = require("config.lsp.null-ls").opts,
	},
}
