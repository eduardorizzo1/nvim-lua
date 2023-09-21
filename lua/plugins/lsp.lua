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
			-- Typescript-tools
			{
				"pmizio/typescript-tools.nvim",
				dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
				opts = {
					on_attach = require("utils.handlers").on_attach,
					settings = {
						tsserver_plugins = {
							"@styled/typescript-styled-plugin", -- for TypeScript v4.9+
							-- "typescript-styled-plugin", -- or for older TypeScript versions
						},
						separate_diagnostic_server = true,
						publish_diagnostic_on = "insert_leave",
					},
				},
			},
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
			require("lspconfig.ui.windows").default_options.border = "rounded"
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
		dependencies = { "mason.nvim", "nvim-lspconfig" },
		opts = function()
			local nls = require("null-ls").builtins

			return {
				sources = {
					nls.formatting.prettierd,
					nls.formatting.stylua,
					nls.formatting.jq,
					nls.formatting.black.with({ extra_args = { "--fast" } }),
					-- nls.code_actions.eslint_d,
					-- nls.code_actions.gitsigns,
					-- nls.diagnostics.eslint_d.with({
					-- 	diagnostics_format = "[eslint] #{m}",
					-- 	-- diagnostics_format = "[eslint] #{m}\n(#{c})",
					-- }),
				},
			}
		end,
	},
}
