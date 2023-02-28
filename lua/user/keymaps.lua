local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ctrl+c to esc
map("n", "<C-c>", "<ESC>", opts)
map("i", "<C-c>", "<ESC>", opts)
map("v", "<C-c>", "<ESC>", opts)
map("c", "<C-c>", "<ESC>", opts)

-- Window Navigate
map("n", "<M-k>", "<C-w>k", opts)
map("n", "<M-j>", "<C-w>j", opts)
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-Up>", "<C-w>k", opts)
map("n", "<C-Down>", "<C-w>j", opts)
map("n", "<C-Left>", "<C-w>h", opts)
map("n", "<C-Right>", "<C-w>l", opts)

-- Resize Window
map("n", "<C-S-k>", ":resize -5<CR>", opts)
map("n", "<C-S-j>", ":resize +5<CR>", opts)
map("n", "<C-S-h>", ":vertical resize +5<CR>", opts)
map("n", "<C-S-l>", ":vertical resize -5<CR>", opts)

map("n", "<C-M-k>", ":resize -5<CR>", opts)
map("n", "<C-M-j>", ":resize +5<CR>", opts)
map("n", "<C-M-h>", ":vertical resize +5<CR>", opts)
map("n", "<C-M-l>", ":vertical resize -5<CR>", opts)

map("n", "<S-up>", ":resize -5<CR>", opts)
map("n", "<S-down>", ":resize +5<CR>", opts)
map("n", "<S-left>", ":vertical resize +5<CR>", opts)
map("n", "<S-right>", ":vertical resize -5<CR>", opts)

-- Up and Down lines
map("n", "J", "5j", opts)
map("n", "K", "5k", opts)
map("n", "<C-j>", "10j", opts)
map("n", "<C-k>", "10k", opts)

-- Split
map("n", "<leader>v", ":vsp<CR>", opts)
map("n", "<leader>h", ":sp<CR>", opts)

-- ctrl+s to save
map("n", "<C-s>", ":w<CR>", opts)
map("i", "<C-s>", "<Esc>:w<CR>", opts)
map("v", "<C-s>", "<Esc>:w<CR>i", opts)

-- save all files
map("n", ";s", ":wa<CR>", opts)

-- ctrl+z
map("n", "<C-z>", ":u<CR>", opts)
map("i", "<C-z>", "<Esc>:u<CR>a", opts)
map("v", "<C-z>", "<Esc>:u<CR>v", opts)
map("c", "<C-z>", "<Esc>:u<CR>c", opts)

-- Delete without copy
map("v", "D", '"_d', opts)

-- ctrl+q to quit
map("n", "<C-q>", ":q<CR>", opts)

-- Toggle highlight match word
map("n", "<leader>*", ":noh<CR>", opts)

-- Toggle Relative number
map("n", "<leader>n", ":set relativenumber!<CR>", opts)

-- ========================================================
------------------ P L U G I N S --------------------------
-- ========================================================

-- Nvimtree
map("n", "<C-b>", ":NvimTreeToggle<CR>", opts)

-- IndentLine
map("n", ";i", ":IndentBlanklineToggle<CR>", opts)

-- Twilight
map("n", ";t", ":Twilight<CR>", opts)

-- Zen-mode
map("n", "<leader>z", ":ZenMode<CR>", opts)

-- Code Runner
map("n", "<C-M-n>", ":RunCode<CR>", opts)

-- Trouble
map("n", "<leader>ee", ":TroubleToggle<CR>", opts)

-- Symbols-outline
map("n", ";b", ":SymbolsOutline<CR>", opts)

-- Bufferline
map("n", "<S-l>", ":bn<CR>", opts) -- next
map("n", "<M-l>", ":bn<CR>", opts)
map("n", "<TAB>", ":bn<CR>", opts)
map("n", "<S-h>", ":bp<CR>", opts) -- previous
map("n", "<M-h>", ":bp<CR>", opts)
map("n", "<S-TAB>", ":bp<CR>", opts)
map("n", "<S-x>", ":bd<Esc>:bp<CR>", opts) -- delete
map("n", "<M-x>", ":bd<Esc>:bp<CR>", opts)

-- Telescope
map(
	"n",
	"<c-p>",
	'<cmd>lua require("telescope.builtin").find_files({ find_command = {"rg", "--files", "--hidden", "-g", "!.git" }})<CR>',
	opts
)
map("n", "<leader>ff", '<cmd>lua require("telescope.builtin").find_files()<CR>', opts)
map("n", "<leader>fg", '<cmd>lua require("telescope.builtin").live_grep()<CR>', opts)
map("n", "<leader>fb", '<cmd>lua require("telescope.builtin").buffers()<CR>', opts)
map("n", "<leader>fh", '<cmd>lua require("telescope.builtin").help_tags()<CR>', opts)
map("n", "<leader>gg", '<cmd>lua require("telescope.builtin").git_status()<CR>', opts)
map("n", "<leader>fa", '<cmd>lua require("telescope.builtin").grep_string()<CR>', opts)

-- LspSaga Mappings
map("n", "gc", "<cmd>Lspsaga code_action<CR>", opts)
map("n", "ga", "<cmd>Lspsaga range_code_action<CR>", opts)
map("n", "gh", "<cmd>Lspsaga hover_doc<CR>", opts)
map("n", "gd", "<cmd>Lspsaga preview_definition<CR>", opts)
map("n", "ge", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
map("n", "gi", "<cmd>Lspsaga implement<CR>", opts)
map("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
map("n", "gn", "<cmd>Lspsaga rename<CR>", opts)
map("n", "gH", "<cmd>Lspsaga signature_help<CR>", opts)
map("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
map("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
map("n", ";ee", "<cmd>lua toggle_diagnostics()<CR>", opts)
map("n", ";et", "<cmd>lua toggle_diagnostics_virtual_text()<CR>", opts)

-- Lsp Mappings (See `:help vim.lsp.*` for documentation on any of the below functions)
map("n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
map("n", "<space>f", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
map("n", "gE", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
map("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
map("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)

-- ToggleTerm
map("n", "<leader>t", ":ToggleTerm <CR>", opts)

-- Git Blame
map("n", ";gg", ":BlamerToggle <CR>", opts)

-- Hop
map("n", "<leader><leader>w", ":HopWordAC<CR>", opts)
map("n", "<leader><leader>b", ":HopWordBC<CR>", opts)
map("n", "<leader><leader>j", ":HopLineAC<CR>", opts)
map("n", "<leader><leader>k", ":HopLineBC<CR>", opts)

-- Debugger (Nvim-Dap)
map("n", "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
map("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", opts)
map("n", "<F10>", "<cmd>lua require'dap'.step_over()<CR>", opts)
map("n", "<F8>", "<cmd>lua require'dap'.step_into()<CR>", opts)
map("n", "<F7>", "<cmd>lua require'dap'.repl.open()<CR>", opts)
