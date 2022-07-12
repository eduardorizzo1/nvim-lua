local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

vim.cmd [[ au VimEnter,WinEnter,BufEnter * setlocal cursorline ]]
vim.cmd [[ au WinLeave * setlocal nocursorline ]]

nvim_tree.setup {
	auto_reload_on_write = true,
  create_in_closed_folder = false,
  disable_netrw = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  open_on_setup = false,
  open_on_setup_file = false,
  open_on_tab = false,
  sort_by = "name",
  update_cwd = false,
  reload_on_bufenter = false,
  respect_buf_cwd = false,
	-- disable_netrw = true,
  -- update_cwd = true,

  view = {	
		adaptive_size = false,
    width = 30,
    height = 30,
		centralize_selection = false,
    hide_root_folder = false,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = {
        { key = "J", action = "" },
        { key = "K", action = "" },
        { key = "<C-k>", action = "" },
        { key = "<C-j>", action = "" },
      },
    },
  },

  renderer = {
    add_trailing = false,
    group_empty = false,
    highlight_git = false,
		full_name = false,
    highlight_opened_files = "name",
    root_folder_modifier = ":t",
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },

    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = false,
        git = true,
      },

			glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          -- open = "",
      		open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          -- unstaged = "✗",
      		unstaged = "",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          -- untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
		special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
  },

	hijack_directories = {
    enable = true,
    auto_open = true,
  },

	update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },

  ignore_ft_on_setup = {"dashboard"},

	system_open = {
    cmd = "",
    args = {},
  },

  diagnostics = {
    enable = true,
		show_on_dirs = true,
    icons = {
      hint = " ",
      info = " ",
      warning = " ",
      error = " ",
    }
  },
  
	filters = {
    dotfiles = false,
		custom = {},
    exclude = {},
  },

	filesystem_watchers = {
    enable = false,
    interval = 100,
  },

  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },

  trash = {
    cmd = "trash",
    require_confirm = true,
  },

  actions = {
    open_file = {
      resize_window = true,
    }
  },
  
	-- update_to_buf_dir = {
 --    enable = true,
 --    auto_open = true,

}
