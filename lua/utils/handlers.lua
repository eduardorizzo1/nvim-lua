local M = {}
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local illuminate = require("illuminate")
local navic = require("nvim-navic")

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true

M.on_attach = function(client, bufnr)
	illuminate.on_attach(client)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	client.server_capabilities.semanticTokensProvider = nil
	vim.g.navic_silence = true

	-- Null-ls
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({
					bufnr = bufnr,
					filter = function(client)
						return client.name == "null-ls"
					end,
				})
			end,
		})
	end

	-- Navic
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
end

return M
