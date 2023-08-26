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
					automatic_installation = false,
				},
			},
			{ "hrsh7th/cmp-nvim-lsp" },
		},
		opts = {
			diagnostics = {
				signs = true,
				update_in_insert = false,
				underline = true,
				severity_sort = true,
				virtual_text = {
					spacing = 4,
					source = "if_many",
					prefix = "●",
				},
			},
		},
		config = function()
			local lspconfig = require("lspconfig")
			require("config.lsp").config(lspconfig)
		end,
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
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "mason.nvim" },
		opts = function()
			local nls = require("null-ls")

			return {
				sources = {
					nls.builtins.code_actions.eslint_d,
					nls.builtins.formatting.prettierd,
					nls.builtins.formatting.stylua,
					nls.builtins.formatting.jq,
				},
			}
		end,
	},
}
