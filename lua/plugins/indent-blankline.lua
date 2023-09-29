return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		enabled = true,
		use_treesitter = true,
		show_first_indent_level = false,
		show_trailing_blankline_indent = false,
		show_current_context = false,
		show_current_context_start = false,
		indent = {
			highlight = {
				"IndentBlanklineIndent1",
			},
			char = "▏",
		},
		whitespace = {
			remove_blankline_trail = false,
		},
		scope = { enabled = false },
		buftype_exclude = { "terminal" },
		filetype_exclude = {
			"help",
			"alpha",
			"dashboard",
			"neo-tree",
			"nvim-tree",
			"Trouble",
			"lazy",
			"mason",
			"notify",
			"toggleterm",
			"lazyterm",
		},
	},
}
