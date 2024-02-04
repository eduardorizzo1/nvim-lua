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
		whitespace = {
			remove_blankline_trail = false,
		},
	},
}
