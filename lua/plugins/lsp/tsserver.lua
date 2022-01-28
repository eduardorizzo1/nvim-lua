require('lspconfig').tsserver.setup {
  on_attach = require('plugins.lsp.config').on_attach,
  filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
  capabilities = require('plugins.lsp.config').capabilities
}

