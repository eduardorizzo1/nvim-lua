local cmd = vim.cmd

require("catppuccin").setup({
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
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
})

cmd([[ hi SignColumn guibg=NONE ]])
-- IndentBlankLine
cmd([[ hi IndentBlanklineContextStart guifg=#CBA6F7 ]])
cmd([[ hi IndentBlanklineContextChar guifg=#CBA6F7 ]])
cmd([[ hi IndentBlanklineIndent1 guifg=#101019 ]])

-- Bufferline
cmd([[ hi BufferLineOffsetSeparator guibg=NONE]])

-- setup must be called before loading
cmd.colorscheme("catppuccin")
