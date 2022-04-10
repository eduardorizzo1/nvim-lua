vim.g.nvim_tree_icons = {
   default = "",
   symlink = "",
   git = {
		unstaged = "",
    staged = "S",
    unmerged = "",
    renamed = "➜",
    deleted = "",
    untracked = "U",
    ignored = "◌",
   },
		
	folder = {
		default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = " ",
    symlink_open = " ",
   },
}

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

vim.cmd[[ au VimEnter,WinEnter,BufEnter * setlocal cursorline ]]
vim.cmd[[ au WinLeave * setlocal nocursorline ]]

vim.g.nvim_tree_highlight_opened_files = 0
vim.g.nvim_tree_highlight_opened_folders = 1
vim.g.nvim_tree_indent_markers = 1

nvim_tree.setup {
	disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = false,
	open_on_setup = false,	
  open_on_tab = false,
  update_cwd = false,
	quit_on_open = 0,
  git_hl = 1,
  disable_window_picker = 0,
  root_folder_modifier = ":t",
	add_trailing = 0,
	highlight_opened_files = 1,
	indent_markers = 1,
  
	show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
    tree_width = 30,
  },

	window_picker_exclude = {
   filetype = { "notify", "packer", "qf", "telescope" },
   buftype = { "terminal" },
	},

	update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },

  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },

  ignore_ft_on_setup = { 
	 "dashboard"
	},

  filters = {
     dotfiles = false,
  },

 update_focused_file = {
    enable      = true,
    update_cwd  = true,
    ignore_list = {}
  },

	view = {
	  width = 30,
	  height = 30,
	  hide_root_folder = false,
	  side = 'left',
	  auto_resize = true,
	  number = false,
	  relativenumber = false,
		signcolumn = "yes",
		preserve_window_proportions = true,

  	mappings = {
  	  custom_only = false,
  	  list = {
				{ key = "J", action = ""},
				{ key = "K", action = ""},
				{ key = "<C-k>", action = ""},
  	  },
  	},
	},

  git = {
	 	enable = true,
    ignore = false,
	 	timeout = 400,
  },

	trash = {
		cmd = "trash",
		require_confirm = true,
	},

	actions = {
		open_file = {
			resize_window = true
		}
	}
}

