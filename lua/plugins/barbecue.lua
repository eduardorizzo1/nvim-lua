return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		symbols = {
			modified = "●",
			ellipsis = "…",
			separator = "",
		},
		exclude_filetypes = { "toggleterm" },

		theme = {
			normal = { bg = "#000000" },
		},
	},
	keys = {
		{ "<leader>u.", '<cmd>lua require("barbecue.ui").toggle()<cr>', desc = "Barbecue Toggle" },
	},
	init = function()
		require("barbecue.ui").toggle(false)
	end,
}
