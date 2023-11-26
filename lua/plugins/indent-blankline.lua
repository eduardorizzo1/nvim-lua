return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		indent = {
			char = "▏", -- "│"
			tab_char = "▏", -- "│"
			highlight = {
				"NonText",
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
