
local opts = {
  }

return  {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },
  event = "BufEnter",
  config = function()
    local actions = require("telescope.actions")
    require("telescope").setup({
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
      path_display = {
        truncate = true,
      },
		  layout_config = {
			  width = 0.9,
			  height = 0.9,
			  prompt_position = "top",
			  preview_cutoff = 10,
			  horizontal = { mirror = false },
			  vertical = { mirror = false },
		  },
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous
        }
      }
    }
    })  
  end
}