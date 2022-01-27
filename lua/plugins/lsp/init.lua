require 'plugins.lsp.lsp-saga'
local nvim_lsp = require'lspconfig'
require 'plugins.lsp.null-ls'
-- local null_ls = require'null-ls'
require 'plugins.lsp.lsp-signature'

vim.o.completeopt = 'menuone,noselect'

local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  local opts = { noremap=true, silent=true }
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = {
      spacing = 4,
      prefix = ' '
    }
  }
)

-- local has_any_words_before = function()
--   if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
--     return false
--   end
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end


--null_ls.setup({
--	on_attach = function(client)
--    if client.resolved_capabilities.document_formatting then
--       vim.cmd([[
--        augroup LspFormatting
--           autocmd! * <buffer>
--           autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
--           augroup END
--        ]])
--     end
--  end,
-- })

-- nvim_lsp.tsserver.setup 
--  on_attach = on_attach,
--  filetypes = {
--		"javascript",
--		"javascriptreact",
--		"javascript.jsx",
--		"typescript",
--		"typescriptreact",
--		"typescript.tsx",
--	},
--  capabilities = capabilities
-- }



-- npm i -g vscode-langservers-extracted

