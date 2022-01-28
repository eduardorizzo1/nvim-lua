local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
  sources = {
		formatting.prettier.with({
  		extra_args = { "--config ./.prettierrc.json"},
		}),

		formatting.stylua.with({
			args = { "--indent-width", "2", "--indent-type", "Spaces", "-" },
		}),

		code_actions.eslint,
		diagnostics.eslint,
	},

  on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
      vim.cmd([[
      	augroup LspFormatting
      	    autocmd! * <buffer>
      	    autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
      	augroup END
      ]])
    end
  end,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = {
      spacing = 4,
      prefix = ' '
    }
  }
)
