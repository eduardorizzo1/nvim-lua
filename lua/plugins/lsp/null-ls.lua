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

  on_attach = require'plugins.lsp.config'.on_attach
})
