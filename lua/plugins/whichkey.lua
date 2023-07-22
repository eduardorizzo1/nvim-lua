local status, wk = pcall(require, "which-key")
if not status then
	return
end

vim.o.timeoutlen = 200

local setup = {
	plugins = {
		marks = false, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = false, -- adds help for motions
			text_objects = false, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = false, -- bindings for folds, spelling and others prefixed with z
			g = false, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "center", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = false, -- show help message on the command line when the popup is visible
	-- triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n",
	prefix = "<c-\\>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	-- LSP
	l = {
		name = "Lsp",
		o = { "<cmd>TSLspOrganize<CR>", "Organize Imports" },
		i = { "<cmd>TSLspImportAll<CR>", "Import All" },
		c = { "<cmd>Lspsaga code_action<CR>", "Code Actions" },
		h = { "<cmd>Lspsaga hover_doc<CR>", "Hover doc" },
		D = { "<cmd>Lspsaga preview_definition<CR>", "Preview Definitions" },
		e = { "<cmd>Lspsaga show_line_diagnostics<CR>", "Show Line Diagnostics" },
		n = { "<cmd>Lspsaga rename<CR>", "Rename" },
		H = { "<cmd>Lspsaga signature_help<CR>", "Signature Help" },
		j = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Diagnostics Jump Next" },
		k = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Diagnostics Jump Prev" },
		d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Difinitions" },
		r = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
		f = { "<cmd>lua vim.lsp.buf.format()<CR>", "Format" },
		I = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementations" },
		t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type Definitions" },
	},

	-- Telescope
	f = {
		name = "Telescope",
		f = { '<cmd>lua require("telescope.builtin").find_files()<CR>', "" },
		g = { '<cmd>lua require("telescope.builtin").live_grep()<CR>', "" },
		b = { '<cmd>lua require("telescope.builtin").buffers()<CR>', "" },
		h = { '<cmd>lua require("telescope.builtin").help_tags()<CR>', "" },
		a = { '<cmd>lua require("telescope.builtin").grep_string()<CR>', "" },
		m = { '<cmd>lua require("telescope").extensions.media_files.media_files()<CR>', "" },
	},

	-- NvimTree
	n = {
		name = "NvimTree",
		r = { "<cmd>NvimTreeResize +10<CR>", "Resize +10" },
		R = { "<cmd>:NvimTreeResize -10<CR>", "Resize -10" },
	},

	-- Terminal
	t = {
		name = "Terminal",
		f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
		h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
		v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
	},
	-- Debuger
	d = {
		name = "Debugger",
		b = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", " Breakpoint" },
		n = { "<cmd>lua require'dap'.continue()<CR>", " Continue" },
		P = { "<cmd>lua require'dap'.pause()<CR>", " Pause" },
		x = { "<cmd>lua require'dap'.close()<CR>", " Terminate" },
		o = { "<cmd>lua require'dap'.step_over()<CR>", " Step Over" },
		p = { "<cmd>lua require'dap'.step_back()<CR>", " Step Back" },
		i = { "<cmd>lua require'dap'.step_into()<CR>", " Step Into" },
		O = { "<cmd>lua require'dap'.step_out()<CR>", " Step Out" },
		l = { "<cmd>lua require'dap'.run_last()<CR>", " Run Last" },
		r = { "<cmd>lua require'dap'.repl.open()<CR>", " Repl Open" },
		d = { "<cmd>lua require'dap'.disconnect()<CR>", " Disconnect" },
	},

	-- Git
	g = {
		name = "Git",
		g = { '<cmd>lua require("telescope.builtin").git_status()<CR>', "Status" },
		b = { '<cmd>lua require("telescope.builtin").git_branches()<CR>', "Branches" },
		c = { '<cmd>lua require("telescope.builtin").git_commits()<CR>', "Commits" },
		f = { '<cmd>lua require("telescope.builtin").git_bcommits()<CR>', "BCommits" },
		s = { '<cmd>lua require("telescope.builtin").git_stash()<CR>', "Stash" },
	},

	-- Keymaps
	[";"] = {
		name = "Toggles",
		d = { "<cmd>lua toggle_diagnostics()<CR>", "Diagnostics" },
		e = { "<cmd>lua toggle_diagnostics_virtual_text()<CR>", "Diagnostics Virtual Text" },
		i = { ":IndentBlanklineToggle<CR>", "IndentBlankLine" },
		t = { ":Twilight<CR>", "Twilight" },
		b = { ":SymbolsOutline<CR>", "SymbolsOutline" },
		s = { ":wa<CR>", "Save All Files" },
		g = {
			name = "Git",
			b = { ":BlamerToggle <CR>" },
			s = { ":Gitsigns toggle_signs <CR>" },
		},
	},
}

wk.setup(setup)
wk.register(mappings, opts)
