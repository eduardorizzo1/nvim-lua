local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

null_ls.setup({
    sources = {
      null_ls.builtins.code_actions.eslint,
      null_ls.builtins.formatting.prettier,
			null_ls.builtins.formatting.stylua
    },
    on_attach = require('plugins.lsp.handlers').on_attach
})
