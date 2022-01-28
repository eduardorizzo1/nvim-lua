local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local on_attach = function(client, bufnr)
 local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
 local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
 buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
 vim.cmd([[
 		augroup LspFormatting
    autocmd! * <buffer>
    autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
   	augroup END
  ]])
end

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

  on_attach = on_attach
})
