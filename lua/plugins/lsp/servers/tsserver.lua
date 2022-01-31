local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
  if client.resolved_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end
end

lspconfig.tsserver.setup({
  on_attach = function(client, bufnr)
  	client.resolved_capabilities.document_formatting = false
  	client.resolved_capabilities.document_range_formatting = false
  	local ts_utils = require("nvim-lsp-ts-utils")
  	ts_utils.setup({})
  	ts_utils.setup_client(client)
  	on_attach(client, bufnr)
  end,

	capabilities = require('cmp_nvim_lsp').update_capabilities(
  	vim.lsp.protocol.make_client_capabilities()
	)
})
