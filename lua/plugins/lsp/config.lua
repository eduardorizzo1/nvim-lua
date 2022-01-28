vim.o.completeopt = 'menuone,noselect'

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = {
      spacing = 4,
      prefix = ' '
    }
  }
)


local M = {}

M.capabilities = function() 
	require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
end

M.on_attach = function()
	local opts = { noremap=true, silent=true }
	local on_attach = function(client, bufnr)
		local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
		local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
		buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
	end
end

return M

