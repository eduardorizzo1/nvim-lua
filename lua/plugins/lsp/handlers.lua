local M = {}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local status_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp then
	return
end

local status_illuminate, illuminate = pcall(require, "illuminate")
if not status_illuminate then
	return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)
M.capabilities.textDocument.completion.completionItem.snippetSupport = true

M.on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	illuminate.on_attach(client)

	-- null-ls
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

	-- tsserver
	if client.name == "tsserver" then
		local ts_utils = require("nvim-lsp-ts-utils")
		require("plugins.lsp.ts-utils")
		ts_utils.setup_client(client)
	end
end

return M
