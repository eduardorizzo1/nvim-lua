local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
	return
end

local function open_nvim_tree(data)
	local directory = vim.fn.isdirectory(data.file) == 1

	if not directory then
		return
	end

	vim.cmd.cd(data.file)

	require("nvim-tree.api").tree.open({
		current_window = true,
	})
end

vim.cmd([[ au VimEnter,WinEnter,BufEnter * setlocal cursorline ]])
vim.cmd([[ au WinLeave * setlocal nocursorline ]])

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

nvim_tree.setup({
	auto_reload_on_write = true,
	create_in_closed_folder = false,
	hijack_cursor = false,
	hijack_netrw = true,
	hijack_unnamed_buffer_when_opening = false,
	open_on_tab = false,
	sort_by = "name",
	disable_netrw = true,
	update_cwd = true,
	reload_on_bufenter = false,
	respect_buf_cwd = false,

	view = {
		adaptive_size = false,
		width = 30,
		centralize_selection = false,
		hide_root_folder = true,
		side = "left",
		preserve_window_proportions = true,
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
				corner = "└",
				edge = "│",
				item = "│",
				none = " ",
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
					untracked = "★",
					-- untracked = "𝗨",
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
		ignore_list = { "toggleterm" },
	},

	-- system_open = {
	-- 	cmd = "",
	-- 	args = {},
	-- },

	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = " ",
			info = " ",
			warning = " ",
			error = " ",
		},
	},

	filters = {
		dotfiles = false,
		custom = {},
		exclude = {},
	},

	filesystem_watchers = {
		enable = false,
		debounce_delay = 50,
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
		},
	},
})
