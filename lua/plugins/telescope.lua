return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
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
	event = "BufEnter",
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
				selection_caret = " ",
				entry_prefix = "  ",
				initial_mode = "insert",
				layout_strategy = "horizontal_merged",
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
}
