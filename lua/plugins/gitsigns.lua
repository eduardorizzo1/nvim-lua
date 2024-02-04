return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "▏" }, -- '▎ ┆ ▏'
			change = { text = "▏" },
			delete = {
				hl = "GitSignsDelete",
				text = "▏",
			},
			topdelete = { text = "▏" },
			changedelete = { text = "▏" },
			untracked = { text = "▏" },
		},
		current_line_blame_formatter = " <author>, <author_time:%Y-%m-%d> • <summary>",
	},
}
