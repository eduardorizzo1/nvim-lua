return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{
			"nvim-telescope/telescope-media-files.nvim",
			opts = {
				media_files = {
					filetypes = { "png", "webp", "jpg", "jpeg" },
					find_cmd = "rg",
				},
			},
		},
	},
	opts = {
		defaults = {
			prompt_prefix = "❯ ",
			selection_caret = " ",
			selection_strategy = "reset",
			sorting_strategy = "ascending",
			layout_strategy = "flex",
			layout_config = {
				prompt_position = "top",
				horizontal = { mirror = false },
				vertical = { mirror = true },
			},
			mappings = {
				i = {
					["<C-j>"] = require("telescope.actions").move_selection_next,
					["<C-k>"] = require("telescope.actions").move_selection_previous,
					["<C-c>"] = require("telescope.actions").close,
				},
			},
		},
	},
	keys = {
		{ "<leader><space>", false },
	},
}
