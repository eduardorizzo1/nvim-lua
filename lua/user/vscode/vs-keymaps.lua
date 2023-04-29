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
map("n", "zR", '<Cmd>call VSCodeNotify("editor.unfoldAll")<CR>', opts)
map("n", "zM", '<Cmd>call VSCodeNotify("editor.foldAll")<CR>', opts)
map("n", "zo", '<Cmd>call VSCodeNotify("editor.unfold")<CR>', opts)
map("n", "zO", '<Cmd>call VSCodeNotify("editor.unfoldRecursively")<CR>', opts)
map("n", "zc", '<Cmd>call VSCodeNotify("editor.fold")<CR>', opts)
map("n", "zC", '<Cmd>call VSCodeNotify("editor.foldRecursively")<CR>', opts)

map("n", "z1", '<Cmd>call VSCodeNotify("editor.foldLevel1")<CR>', opts)
map("n", "z2", '<Cmd>call VSCodeNotify("editor.foldLevel2")<CR>', opts)
map("n", "z3", '<Cmd>call VSCodeNotify("editor.foldLevel3")<CR>', opts)
map("n", "z4", '<Cmd>call VSCodeNotify("editor.foldLevel4")<CR>', opts)
map("n", "z5", '<Cmd>call VSCodeNotify("editor.foldLevel5")<CR>', opts)
map("n", "z6", '<Cmd>call VSCodeNotify("editor.foldLevel6")<CR>', opts)
map("n", "z7", '<Cmd>call VSCodeNotify("editor.foldLevel7")<CR>', opts)

map("x", "zV", '<Cmd>call VSCodeNotify("editor.foldAllExcept")<CR>', opts)

-- ============== PLUGINS ==========================
-- Hop
map("n", "<leader><leader>w", ":HopWordAC<CR>", opts)
map("n", "<leader><leader>b", ":HopWordBC<CR>", opts)
map("n", "<leader><leader>j", ":HopLineAC<CR>", opts)
map("n", "<leader><leader>k", ":HopLineBC<CR>", opts)

-- Window Navigate
-- map("n", "<C-h>", "<C-w>h", opts)
-- map("n", "<C-l>", "<C-w>l", opts)
-- map("n", "<M-j>", "<C-w>j", opts)
-- map("n", "<M-k>", "<C-w>k", opts)
--
-- map("n", "<space>", "za", { noremap = true, silent = true })
--
-- vim.api.nvim_set_keymap("n", "<space>", "za", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>za", "zA", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>zr", "zR", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>zm", "zM", { noremap = true, silent = true })
--
--
-- -- Resize Window
-- map("n", "<leader>l", ":vertical resize -5<CR>", opts)
-- map("n", "<leader>h", ":vertical resize +5<CR>", opts)
--
-- -- ctrl+s to save
-- map("n", "<C-s>", ":w<CR>", opts)
-- map("i", "<C-s>", "<Esc>:w<CR>", opts)
-- map("v", "<C-s>", "<Esc>:w<CR>", opts)
--
-- -- Delete without copy
-- map("v", "D", '"_d', opts)
--
-- -- ctrl+q to quit
-- map("n", "<C-q>", ":q<CR>", opts)
--
-- -- Toggle highlight match word
-- map("n", "<leader>*", ":noh<CR>", opts)
--
-- -- Toggle Relative number
-- map("n", "<leader>n", ":set relativenumber!<CR>", opts)
--
-- -- ESC
-- map("n", "<C-]>", "<Esc><Esc>", opts)
-- map("i", "<C-]>", "<Esc><Esc>", opts)
-- map("v", "<C-]>", "<Esc><Esc>", opts)
--
-- -- ========================================================
-- ------------------ P L U G I N S --------------------------
-- -- ========================================================
