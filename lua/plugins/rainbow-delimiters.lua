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
				javascript = "rainbow-parens",
				tsx = "rainbow-parens",
			},
			highlight = {
				"RainbowDelimiterYellow",
				"RainbowDelimiterPink",
				"RainbowDelimiterCyan",
				"RainbowDelimiterGreen",
				"RainbowDelimiterPurple",
				"RainbowDelimiterOrange",
				-- "RainbowDelimiterBlue",
				-- "RainbowDelimiterRed",
			},
			blacklist = { "html" },
		}
	end,
}
