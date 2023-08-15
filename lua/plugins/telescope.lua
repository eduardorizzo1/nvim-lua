return {
  "nvim-telescope/telescope.nvim",
  tag = '0.1.2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    defaults = {
      prompt_prefix = "❯ ",
		  selection_caret = " ",
		  entry_prefix = "  ",
		  initial_mode = "insert",
		  layout_strategy = "horizontal",
		  borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      selection_strategy = "reset",
		  sorting_strategy = "ascending",
		  file_ignore_patterns = { "node_modules", "dist", "build" },

		  layout_config = {
			  width = 0.9,
			  height = 0.9,
			  prompt_position = "top",
			  preview_cutoff = 10,
			  horizontal = { mirror = false },
			  vertical = { mirror = false },
		  },

		  path_display = {
		  	truncate = true,
		  },
		  winblend = 0,
		  border = {},
		  color_devicons = true,
		  use_less = true,

      mappings = {
        i = {
        }
      }
    },
    pickers = {
    },
    extensions = {
    } 
  },
}