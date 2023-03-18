local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end

local code_actions = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting

null_ls.setup({
	sources = {
		code_actions.eslint,
		formatting.prettier,
		formatting.stylua,
		formatting.jq,
	},
	on_attach = require("plugins.lsp.handlers").on_attach,
})
