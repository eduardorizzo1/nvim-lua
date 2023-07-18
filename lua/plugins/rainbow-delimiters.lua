local status, rainbow_delimiters = pcall(require, "rainbow-delimiters")

if not status then
	return
end

vim.g.rainbow_delimiters = {
	strategy = {
		[""] = rainbow_delimiters.strategy["global"],
		commonlisp = rainbow_delimiters.strategy["local"],
	},
	query = {
		[""] = "rainbow-delimiters",
		-- lua = "rainbow-blocks",
	},
	highlight = {
		"RainbowDelimiterYellow",
		"RainbowDelimiterCyan",
		"RainbowDelimiterPink",
		"RainbowDelimiterPurple",
		"RainbowDelimiterOrange",
		"RainbowDelimiterBlue",
	},
	blacklist = { "c", "cpp" },
}
