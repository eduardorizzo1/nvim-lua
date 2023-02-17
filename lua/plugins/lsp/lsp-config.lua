local lspconfig = require("lspconfig")
local lspcolors = require("lsp-colors")
local icons = require("user.icons")

lspcolors.setup({
	Error = "#db4b4b",
	Warning = "#e0af68",
	Information = "#0db9d7",
	Hint = "#10B981",
})

lspconfig.tsserver.setup({
	on_attach = require("plugins.lsp.handlers").on_attach,
	capabilities = require("plugins.lsp.handlers").capabilities,
})

vim.o.completeopt = "menuone,noselect"
vim.diagnostic.config({
	underline = true,
	signs = true,
	virtual_text = {
		spacing = 4,
		prefix = icons.fire,
	},
})

local diagnostics_active = true
function _G.toggle_diagnostics()
	diagnostics_active = not diagnostics_active
	if diagnostics_active then
		vim.api.nvim_echo({ { "Show diagnostics" } }, false, {})
		vim.diagnostic.enable()
	else
		vim.api.nvim_echo({ { "Disable diagnostics" } }, false, {})
		vim.diagnostic.disable()
	end
end

local diagnostics_virtual_text = true
function _G.toggle_diagnostics_virtual_text()
	diagnostics_virtual_text = not diagnostics_virtual_text
	if diagnostics_virtual_text then
		vim.diagnostic.config({ virtual_text = true })
	else
		vim.diagnostic.config({ virtual_text = false })
	end
end
