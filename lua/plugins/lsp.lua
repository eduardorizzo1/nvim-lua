return {
	"neovim/nvim-lspconfig",
	init = function()
		require("lspconfig.ui.windows").default_options.border = "rounded"
		local keys = require("lazyvim.plugins.lsp.keymaps").get()
		keys[#keys + 1] = { "K", false }
		keys[#keys + 1] = { "gr", false }
		keys[#keys + 1] = { "<leader>cc", false } -- Run Codelens
		keys[#keys + 1] = { "<leader>cC", false } -- Refresh & Display Codelens
		vim.diagnostic.config({
			virtual_text = require("utils.virtual-text").virtual_text,
		})
	end,
}
