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
			---@type string
			modified = "●",

			---@type string
			ellipsis = "…",

			---@type string
			-- separator = "",
			separator = "›",
		},
		exclude_filetypes = { "toggleterm" },
		-- kinds = require("utils.icons").kinds,
	},
	-- init = function()
	-- 	require("barbecue.ui").toggle(false)
	-- end,
}
