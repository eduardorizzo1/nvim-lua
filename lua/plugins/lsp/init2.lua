
require 'plugins.lsp.config'
require 'plugins.lsp.lsp-saga'
require 'plugins.lsp.lsp-signature'
require 'plugins.lsp.tsserver'
-- require 'plugins.lsp.null-ls'

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = {
      spacing = 4,
      prefix = ' '
    }
  }
)

