return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		indent = {
			char = "▏",
			-- char = "│",
			highlight = {
				"IndentBlanklineIndent1",
			},
		},
		scope = {
			enabled = false,
			show_start = true,
			show_end = true,
		},
		exclude = {
			filetypes = {
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
			buftypes = { "terminal" },
		},
		whitespace = {
			remove_blankline_trail = false,
		},
	},
}

-- enabled = true,
-- use_treesitter = true,
-- show_first_indent_level = false,
-- show_trailing_blankline_indent = false,
-- show_current_context = false,
-- show_current_context_start = false,
