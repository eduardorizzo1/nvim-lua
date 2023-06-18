local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Undo / Redo
map("", "<C-z>", '<Cmd>call VSCodeNotify("undo")<CR>', opts)
map("", "<C-r>", '<Cmd>call VSCodeNotify("redo")<CR>', opts)

-- Jump Lines
map("n", "J", "5j", opts)
map("n", "K", "5k", opts)
map("n", "H", "5h", opts)
map("n", "L", "5l", opts)
map("n", "<C-j>", "10j", opts)
map("n", "<C-k>", "10k", opts)

-- Fold
map("n", "za", '<Cmd>call VSCodeNotify("editor.toggleFold")<CR>', opts)
map("n", "zA", '<Cmd>call VSCodeNotify("editor.foldAll")<CR>', opts)
map("n", "zF", '<Cmd>call VSCodeNotify("editor.unfoldAll")<CR>', opts)

-- Comments
map("n", "<leader>cc", '<Cmd>call VSCodeNotify("editor.action.commentLine")<CR>', opts)
map("v", "<leader>ca", '<Cmd>call VSCodeNotify("editor.action.commentLine")<CR>', opts)

-- Sidebar
map("n", "<leader>ff", '<Cmd>call VSCodeNotify("actions.find")<CR>', opts)
map("n", "<leader>fg", '<Cmd>call VSCodeNotify("workbench.action.findInFiles")<CR>', opts)
map("n", "<leader>gg", '<Cmd>call VSCodeNotify("workbench.view.scm")<CR>', opts)

-- Actions
map("n", "<leader>gi", '<Cmd>call VSCodeNotify("editor.actions.goToImplementation")<CR>', opts)
map("n", "<leader>gD", '<Cmd>call VSCodeNotify("editor.action.peekDefinition")<CR>', opts)
map("n", "<leader>gd", '<Cmd>call VSCodeNotify("editor.action.revealDefinition")<CR>', opts)
map("n", "<leader>gc", '<Cmd>call VSCodeNotify("editor.action.quickFix")<CR>', opts)
map("n", "<leader>gn", '<Cmd>call VSCodeNotify("editor.action.rename")<CR>', opts)

-- Problems
map("n", "<leader>e", '<Cmd>call VSCodeNotify("workbench.actions.view.problems")<CR>', opts)
map("n", "<leader>j", '<Cmd>call VSCodeNotify("editor.action.marker.nextInFiles")<CR>', opts)
map("n", "<leader>k", '<Cmd>call VSCodeNotify("editor.action.marker.prevInFiles")<CR>', opts)

-- Split
map("n", "<leader>v", '<Cmd>call VSCodeNotify("workbench.action.splitEditor")<CR>', opts)
map("n", "<leader>V", '<Cmd>call VSCodeNotify("workbench.action.splitEditorDown")<CR>', opts)

-- Toggle Highlight
map("n", "<leader>*", ":noh<CR>", opts)

-- Window Navigate
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<M-j>", "<C-w>j", opts)
map("n", "<M-k>", "<C-w>k", opts)

-- Delete without copy
map("v", "D", '"_d', opts)

-- Toggle Relative number
map("n", "<leader>n", ":set relativenumber!<CR>", opts)
--
-- -- ESC
map("n", "<C-]>", "<Esc><Esc>", opts)
map("i", "<C-]>", "<Esc><Esc>", opts)
map("v", "<C-]>", "<Esc><Esc>", opts)

-- -- ========================================================
-- ------------------ P L U G I N S --------------------------
-- -- ========================================================

-- Hop
map("n", "<leader><leader>w", ":HopWordAC<CR>", opts)
map("n", "<leader><leader>b", ":HopWordBC<CR>", opts)
map("n", "<leader><leader>j", ":HopLineAC<CR>", opts)
map("n", "<leader><leader>k", ":HopLineBC<CR>", opts)
