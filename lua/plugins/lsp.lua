return {
	"neovim/nvim-lspconfig",
	init = function()
		require("lspconfig.ui.windows").default_options.border = "rounded"
		local keys = require("lazyvim.plugins.lsp.keymaps").get()
		keys[#keys + 1] = { "K", false }
		keys[#keys + 1] = { "gr", false }
		vim.diagnostic.config({
			virtual_text = require("utils.virtual-text").virtual_text,
		})
	end,
	opts = {
		servers = {
			tsserver = {
				keys = {
					{
						"gO",
						function()
							vim.lsp.buf.code_action({
								apply = true,
								context = {
									only = { "source.organizeImports.ts" },
									diagnostics = {},
								},
							})
						end,
						desc = "Organize Imports",
					},
					{
						"gU",
						function()
							vim.lsp.buf.code_action({
								apply = true,
								context = {
									only = { "source.removeUnused.ts" },
									diagnostics = {},
								},
							})
						end,
						desc = "Remove Unused Imports",
					},
				},
				---@diagnostic disable-next-line: missing-fields
				settings = {
					completions = {
						completeFunctionCalls = true,
					},
				},
			},
		},
	},
}
