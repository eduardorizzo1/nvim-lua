require("plugins.lsp.lsp-installer")
require("plugins.lsp.lsp-saga")
require("plugins.lsp.lsp-signature")
require("plugins.lsp.servers.tsserver")
require("plugins.lsp.null-ls")

vim.o.completeopt = "menuone,noselect"

vim.diagnostic.config({
	underline = true,
	virtual_text = {
		spacing = 4,
		prefix = " ",
	},
})
