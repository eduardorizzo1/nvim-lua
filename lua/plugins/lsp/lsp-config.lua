local status, lspconfig = pcall(require, "lspconfig")
if not status then
	return
end

lspconfig.tsserver.setup({
	on_attach = require("plugins.lsp.handlers").on_attach,
	capabilities = require("plugins.lsp.handlers").capabilities,
})

local diagnostics_active = true
local diagnostics_virtual_text = true
local virtual_text_on = {
	virtual_text = {
		spacing = 4,
		prefix = "●",
	},
}
local virtual_text_off = {
	virtual_text = false,
}

vim.o.completeopt = "menuone,noselect"
vim.diagnostic.config({
	underline = true,
	signs = true,
	severity_sort = true,
	virtual_text = false,
})

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

function _G.toggle_diagnostics_virtual_text()
	diagnostics_virtual_text = not diagnostics_virtual_text
	if diagnostics_virtual_text then
		vim.api.nvim_echo({ { "Virtual text ON" } }, false, {})
		vim.diagnostic.config(virtual_text_on)
	else
		vim.api.nvim_echo({ { "Virtual text OFF" } }, false, {})
		vim.diagnostic.config(virtual_text_off)
	end
end
