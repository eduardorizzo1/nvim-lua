require("plugins.lsp.lsp-installer")
require("plugins.lsp.lsp-saga")
require("plugins.lsp.lsp-signature")
require("plugins.lsp.servers.tsserver")
require("plugins.lsp.null-ls")
require("plugins.lsp.lsp-colors")

vim.o.completeopt = "menuone,noselect"

vim.diagnostic.config({
	underline = true,
	update_in_insert = false,

	virtual_text = {
		spacing = 4,
		prefix = " ",
	},
})
