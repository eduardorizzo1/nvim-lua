local status, mason = pcall(require, "mason")
local status2, mason_lspconfig = pcall(require, "mason-lspconfig")

if not status or not status2 then
	return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

mason_lspconfig.setup({})
