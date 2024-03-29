return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{
			"nvim-telescope/telescope-media-files.nvim",
			opts = {
				media_files = {
					-- filetypes whitelist
					-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
					filetypes = { "png", "webp", "jpg", "jpeg" },
					-- find command (defaults to `fd`)
					find_cmd = "rg",
				},
			},
		},
	},
	config = function()
		local actions = require("telescope.actions")
		require("telescope").load_extension("media_files")
		require("telescope.pickers.layout_strategies").horizontal_merged = function(
			picker,
			max_columns,
			max_lines,
			layout_config
		)
			local layout =
				require("telescope.pickers.layout_strategies").horizontal(picker, max_columns, max_lines, layout_config)
			layout.prompt.title = "Find Files"
			layout.prompt.borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
			layout.results.title = ""
			layout.results.borderchars = { "─", "│", "─", "│", "├", "┤", "╯", "╰" }
			layout.results.line = layout.results.line - 1
			layout.results.height = layout.results.height + 1
			layout.preview.title = "Preview"
			layout.preview.borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

			return layout
		end

		require("telescope").setup({
			defaults = {
				prompt_prefix = "❯ ",
				selection_caret = " ", -- "  "
				entry_prefix = "  ",
				initial_mode = "insert",
				layout_strategy = "flex",
				layout_config = {
					width = 0.9,
					height = 0.9,
					prompt_position = "top",
					preview_cutoff = 10,
					horizontal = { mirror = false },
					vertical = { mirror = true },
				},
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				selection_strategy = "reset",
				sorting_strategy = "ascending",
				file_ignore_patterns = { "node_modules", "dist", "build" },
				path_display = {
					truncate = true,
				},
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-c>"] = actions.close,
					},
				},
			},
		})
	end,
	keys = {
		{ "<leader><space>", false },
	},
}
