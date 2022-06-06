local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

vim.cmd [[ au VimEnter,WinEnter,BufEnter * setlocal cursorline ]]
vim.cmd [[ au WinLeave * setlocal nocursorline ]]

nvim_tree.setup {
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = false,
  open_on_setup = false,
  open_on_tab = false,
  update_cwd = true,

  renderer = {
    add_trailing = false,
    group_empty = false,
    highlight_git = false,
    highlight_opened_files = "none",
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
      },
    },
  },

  update_to_buf_dir = {
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
		adaptive_size=true,
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
        { key = "J", action = "" },
        { key = "K", action = "" },
        { key = "<C-k>", action = "" },
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
      resize_window = false
    }
  }
}
