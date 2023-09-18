local M = {}

M.init = function()
	vim.cmd.colorscheme("catppuccin")
	vim.cmd([[ hi SignColumn guibg=NONE ]])
	vim.cmd([[ hi IndentBlanklineContextStart guifg=#CBA6F7 ]])
	vim.cmd([[ hi IndentBlanklineContextChar guifg=#CBA6F7 ]])
	vim.cmd([[ hi IndentBlanklineIndent1 guifg=#101019 ]])
	vim.cmd([[ hi BufferLineSeparator guifg=#101019 guibg=#161623]])
	vim.cmd([[ hi BufferLineFill guibg=#101019]])
end

M.opts = {
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = false,
	show_end_of_buffer = false, -- show the '~' characters after the end of buffers
	term_colors = false,
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	no_italic = false, -- Force no italic
	no_bold = false, -- Force no bold
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	color_overrides = {},
	custom_highlights = {},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		telescope = true,
		notify = false,
		mini = false,
		indent_blankline = {
			enabled = false,
			colored_indent_levels = false,
		},
	},
}

return M
