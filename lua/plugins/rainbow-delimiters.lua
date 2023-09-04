return {
	"HiPhish/rainbow-delimiters.nvim",
	config = function()
		local rainbow_delimiters = require("rainbow-delimiters")

		vim.g.rainbow_delimiters = {
			strategy = {
				[""] = rainbow_delimiters.strategy["global"],
				vim = rainbow_delimiters.strategy["global"],
			},
			query = {
				[""] = "rainbow-delimiters",
				lua = "rainbow-blocks",
			},
			highlight = {
				"RainbowDelimiterYellow",
				"RainbowDelimiterBlue",
				"RainbowDelimiterCyan",
				"RainbowDelimiterPink",
				"RainbowDelimiterGreen",
				"RainbowDelimiterPurple",
				"RainbowDelimiterOrange",
			},
		}
	end,
}
