local status, mason = pcall(require, "mason")
local status2, mason_lspconfig = pcall(require, "mason-lspconfig")
local status3, lspconfig = pcall(require, "lspconfig")

if not status or not status2 or not status3 then
	return
end

mason.setup({
	ui = {
		border = "rounded",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

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

mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = false,
})

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("plugins.lsp.handlers").on_attach,
		capabilities = require("plugins.lsp.handlers").capabilities,
		autostart = true,
		settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
			},
		},
	}

	lspconfig[server].setup(opts)
end
