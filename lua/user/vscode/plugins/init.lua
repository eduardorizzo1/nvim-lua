local packer = require("packer")

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

packer.startup(function(use)
	use({ "phaazon/hop.nvim", branch = "v1" })
	use({ "echasnovski/mini.nvim", branch = "stable" }) -- Surround
end)
