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
			separator = "›",
		},
		exclude_filetypes = { "toggleterm" },
	},
	init = function()
		require("barbecue.ui").toggle(false)
	end,
}
