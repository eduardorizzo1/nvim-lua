local opts = { noremap = true, silent = true }
local map = vim.keymap.set
local Util = require("lazyvim.util")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- C-c ESC
map({ "n", "i", "v", "x" }, "<C-c>", "<ESC>", opts)

-- Window Navigate
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<M-j>", "<C-w>j", opts)
map("n", "<M-k>", "<C-w>k", opts)

map("n", "<C-Up>", "<C-w>k", opts)
map("n", "<C-Down>", "<C-w>j", opts)
map("n", "<C-Left>", "<C-w>h", opts)
map("n", "<C-Right>", "<C-w>l", opts)

map("n", "<C-S-k>", "<C-w>k", opts)
map("n", "<C-S-j>", "<C-w>j", opts)
map("n", "<C-S-h>", "<C-w>h", opts)
map("n", "<C-S-l>", "<C-w>l", opts)

-- Resize Window
map("n", "<C-M-k>", "<cmd>resize -5<cr>", opts)
map("n", "<C-M-j>", "<cmd>resize +5<cr>", opts)
map("n", "<C-M-h>", "<cmd>vertical resize +5<cr>", opts)
map("n", "<C-M-l>", "<cmd>vertical resize -5<cr>", opts)

map("n", "<S-up>", "<cmd>resize -5<cr>", opts)
map("n", "<S-down>", "<cmd>resize +5<cr>", opts)
map("n", "<S-left>", "<cmd>vertical resize +5<cr>", opts)
map("n", "<S-right>", "<cmd>vertical resize -5<cr>", opts)

-- Up and Down lines
map({ "n", "x" }, "J", "5j", opts)
map({ "n", "x" }, "K", "5k", opts)
map({ "n", "x" }, "<C-j>", "10j", opts)
map({ "n", "x" }, "<C-k>", "10k", opts)

-- Split
map("n", "<leader>v", "<cmd>vsp<cr>", opts)
map("n", "<leader>h", "<cmd>sp<cr>", opts)

-- save all files
map("n", ";s", "<CMD>wa<cr>", opts)

-- ctrl+z
map("n", "<C-z>", "<cmd>u<cr>", opts)
map("i", "<C-z>", "<Esc><cmd>u<cr>a", opts)
map("v", "<C-z>", "<Esc><cmd>u<cr>v", opts)
map("c", "<C-z>", "<Esc><cmd>u<cr>c", opts)
map("x", "<C-z>", "<Esc><cmd>u<cr>", opts)

-- Delete without copy
map("v", "D", '"_d', opts)

-- ctrl+q to quit
map("n", "<C-q>", "<cmd>q<cr>", opts)

-- Toggle highlight match word
map("n", "<leader>*", "<cmd>noh<cr>", opts)

-- Toggle Relative number
map("n", "<leader>n", "<cmd>set relativenumber!<cr>", opts)

-- ========================================================
------------------ P L U G I N S --------------------------
-- ========================================================
if not vim.g.vscode then
	-- Nvimtree
	map("n", "<C-b>", "<cmd>NvimTreeToggle<cr>", opts)
	map("n", "_", "<cmd>NvimTreeResize -5<cr>", opts)
	map("n", "+", "<cmd>NvimTreeResize +5<cr>", opts)

	-- IndentLine
	map("n", ";i", "<cmd>IBLToggle<cr>", opts)

	-- Code Runner
	map("n", "<C-M-n>", "<cmd>RunCode<cr>", opts)

	-- Trouble
	map("n", "<leader>e", "<cmd>TroubleToggle<cr>", opts)

	-- Bufferline
	map("n", "<S-l>", "<CMD>BufferLineCycleNext<cr>", opts) -- next
	map("n", "<M-l>", "<CMD>BufferLineCycleNext<cr>", opts)
	map("n", "<TAB>", "<CMD>BufferLineCycleNext<cr>", opts)
	map("n", "<S-h>", "<CMD>BufferLineCyclePrev<cr>", opts) -- previous
	map("n", "<M-h>", "<CMD>BufferLineCyclePrev<cr>", opts)
	map("n", "<S-TAB>", "<CMD>BufferLineCyclePrev<cr>", opts)
	map("n", "<S-x>", "<CMD>bd<cr>", opts) -- delete
	map("n", "<M-x>", "<CMD>bd<cr>", opts)
	map("n", "<M-t>", "<CMD>tabnew<cr>", opts) -- tabs
	map("n", "<M-[>", "<CMD>tabnext<cr>", opts)
	map("n", "<M-]>", "<CMD>tabprevious<cr>", opts)

	-- Telescope
	map(
		"n",
		"<c-p>",
		'<cmd>lua require("telescope.builtin").find_files({ find_command = {"rg", "--files", "--hidden", "-g", "!.git" }})<cr>',
		opts
	)
	map("n", "<leader>ff", '<cmd>lua require("telescope.builtin").find_files()<cr>', opts)
	map("n", "<leader>fg", '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
	map("n", "<leader>fb", '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
	map("n", "<leader>fh", '<cmd>lua require("telescope.builtin").help_tags()<cr>', opts)
	map("n", "<leader>fa", '<cmd>lua require("telescope.builtin").grep_string()<cr>', opts)
	map("n", "<leader>fm", '<cmd>lua require("telescope").extensions.media_files.media_files()<cr>', opts)
	map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", opts)
	-- map("n", "<leader>gg", '<cmd>lua require("telescope.builtin").git_status()<cr>', opts)
	map("n", "<leader>gb", '<cmd>lua require("telescope.builtin").git_branches()<cr>', opts)
	map("n", "<leader>gc", '<cmd>lua require("telescope.builtin").git_commits()<cr>', opts)
	map("n", "<leader>gs", '<cmd>lua require("telescope.builtin").git_stash()<cr>', opts)

	-- Lsp Saga
	map("n", "gi", "<cmd>Lspsaga incoming_calls<cr>", opts)
	map("n", "go", "<cmd>Lspsaga outgoing_calls<cr>", opts)
	map("n", "gc", "<cmd>Lspsaga code_action<cr>", opts)
	map("n", "gd", "<cmd>Lspsaga goto_definition<cr>", opts)
	map("n", "gD", "<cmd>Lspsaga peek_definition<cr>", opts)
	map("n", "gt", "<cmd>Lspsaga goto_type_definition<cr>", opts)
	map("n", "gT", "<cmd>Lspsaga peek_type_definition<cr>", opts)
	-- map("n", "gn", "<cmd>Lspsaga rename<cr>", opts)
	map("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opts)
	map("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
	map("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
	map("n", "ge", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
	map("n", "gr", "<cmd>Lspsaga finder<cr>", opts)
	map("n", "<M-b>", "<cmd>Lspsaga outline<cr>", opts)
	map("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<cr>", opts)

	-- ToggleTerm
	map("n", "<leader>t", '<cmd>ToggleTerm direction="float"<cr>', opts)
	map("n", "<C-\\>", '<cmd>ToggleTerm direction="horizontal"<cr>', opts)
	map("t", "<C-\\>", "<cmd>close<cr>", { desc = "Hide Terminal" })
	map("t", "<M-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
	map("t", "<M-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })

	-- Lazygit
	map("n", "<leader>gg", "<cmd>LazyGit<cr>", opts)

	-- Toggles
	map("n", ";gb", "<cmd>BlamerToggle <cr>", opts)
	map("n", ";gs", "<cmd>Gitsigns toggle_signs <cr>", opts)
	map("n", ";d", "<cmd>lua toggle_diagnostics()<cr>", opts)
	map("n", ";e", "<cmd>lua toggle_virtual_text()<cr>", opts)

	-- Hop
	map("n", "<leader>w", "<cmd>HopWordAC<cr>", opts)
	map("n", "<leader>b", "<cmd>HopWordBC<cr>", opts)
	map("n", "<leader>j", "<cmd>HopLineAC<cr>", opts)
	map("n", "<leader>k", "<cmd>HopLineBC<cr>", opts)

	-- Debugger (Nvim-Dap)
	map("n", "<leader>1", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
	map("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", opts)
	map("n", "<F10>", "<cmd>lua require'dap'.step_over()<cr>", opts)
	map("n", "<F8>", "<cmd>lua require'dap'.step_into()<cr>", opts)
	map("n", "<F7>", "<cmd>lua require'dap'.repl.open()<cr>", opts)

	-- typescript-tools
	map("n", "gI", "<cmd>TSToolsAddMissingImports<cr>", opts)
	map("n", "gO", "<cmd>TSToolsOrganizeImports<cr>", opts)
	map("n", "gU", "<cmd>TSToolsRemoveUnused<cr>", opts)
	map("n", "gF", "<cmd>TSToolsFixAll<cr>", opts)

	-- Spectre
	map("n", "<leader>S", '<cmd>lua require("spectre").toggle()<cr>', {
		desc = "Toggle Spectre",
	})
	map("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<cr>', {
		desc = "Search current word",
	})
	map("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<cr>', {
		desc = "Search current word",
	})
	map("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<cr>', {
		desc = "Search on current file",
	})

	-- Barbecue
	map("n", ";.", '<cmd>lua require("barbecue.ui").toggle()<cr>', opts)

	-- Rest
	map("n", "gR", '<cmd>lua require("rest-nvim").run()<cr>', opts)

	-- IncRename
	map("n", "gn", ":IncRename ", opts)

	-- Markdown Preview
	map("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", opts)
end
