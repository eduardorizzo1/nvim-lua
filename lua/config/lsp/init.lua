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

M.config_servers = function(lspconfig)
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

M.config = function()
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "none" })
	end

	local virtual_text_on = {
		virtual_text = {
			spacing = 4,
			source = "if_many",
			prefix = "●",
		},
	}

	vim.diagnostic.config({
		signs = true,
		update_in_insert = false,
		underline = true,
		severity_sort = true,
		virtual_text = virtual_text_on.virtual_text,
	})

	local diagnostics_active = true
	local diagnostics_virtual_text = true

	local virtual_text_off = {
		virtual_text = false,
	}

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
end

return M
