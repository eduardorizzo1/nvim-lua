local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)

local status_ok, illuminate = pcall(require, "illuminate")
if not status_ok then
	return
end

M.on_attach = function(client, bufnr)
	client.resolved_capabilities.document_formatting = false
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	illuminate.on_attach(client)

	if client.name == "null-ls" then
		client.resolved_capabilities.document_formatting = true
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		end
	end

	if client.name == "tsserver" then
		local ts_utils = require("nvim-lsp-ts-utils")
		require("plugins.lsp.ts-utils")
		ts_utils.setup_client(client)
		local opts = { silent = true }
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
	end
end

return M
