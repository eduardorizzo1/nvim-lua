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
	if client.name == "tsserver" then
  	client.resolved_capabilities.document_formatting = false
  	local ts_utils = require("nvim-lsp-ts-utils")
  	ts_utils.setup({})
  	ts_utils.setup_client(client)
	end

  illuminate.on_attach(client)
end

return M
