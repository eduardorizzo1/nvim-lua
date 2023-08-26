local M = {}
local signs = require("utils.icons").signs

local servers = {
	"lua_ls",
	"tsserver",
	"jsonls",
	"angularls",
	"vuels",
	"html",
	"cssls",
	"cssmodules_ls",
	"tailwindcss",
	"prismals",
	"graphql",
	"marksman",
	"dockerls",
	"dotls",
	"bashls",
	"emmet_ls",
	"solc",
	"tflint",
	"pyright",
	"yamlls",
	"clangd",
}

M.config = function(lspconfig)
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "none" })
	end

	vim.diagnostic.config({
		signs = true,
		update_in_insert = false,
		underline = true,
		severity_sort = true,
		virtual_text = require("utils.handlers").virtual_text,
	})

	for _, server in pairs(servers) do
		lspconfig[server].setup({
			on_attach = require("utils.handlers").on_attach,
			capabilities = require("utils.handlers").capabilities,
			autostart = true,
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
				},
			},
		})
	end
end

return M
