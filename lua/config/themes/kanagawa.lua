local M = {}

M.opts = {
	compile = false, -- enable compiling the colorscheme
	undercurl = true, -- enable undercurls
	commentStyle = { italic = true },
	functionStyle = {},
	keywordStyle = { italic = true },
	statementStyle = { bold = true },
	typeStyle = {},
	transparent = true, -- do not set background color
	dimInactive = false, -- dim inactive window `:h hl-NormalNC`
	terminalColors = true, -- define vim.g.terminal_color_{0,17}
	colors = { -- add/modify theme and palette colors
		palette = {},
		theme = {
			wave = {
				ui = {
					snackspicker = "none",
				},
			},
			lotus = {},
			dragon = {},
			all = {
				bg_gutter = "none",
			},
		},
	},
	overrides = function(colors) -- add/modify highlights
		return {
			SnacksPicker = { bg = "#000000" },
			LineNr = { bg = "#000000" },
			GitSignsAdd = { bg = "#000000" },
			GitSignsChange = { bg = "#000000" },
			GitSignsDelete = { bg = "#000000" },
			-- BufferLineBackground = { fg = "#464e72" },
			BufferLineFill = { bg = "#000000" },
			BufferLineBufferSelected = { italic = true, bold = true },
			BufferLineSeparatorSelected = { fg = "#000000" },
			BufferLineSeparatorVisible = { fg = "#000000" },
			BufferLineSeparator = { fg = "#000000" },
			BufferLineIndicatorSelected = { fg = "#000000" },
			Pmenu = { bg = "#000000" },
		}
	end,
	theme = "wave", -- Load "wave" theme
	background = { -- map the value of 'background' option to a theme
		dark = "wave", -- try "dragon" !
		light = "lotus",
	},
}

M.config = function()
	require("kanagawa").setup(M.opts)
	vim.cmd("colorscheme kanagawa")
end

return M
