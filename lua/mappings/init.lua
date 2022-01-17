local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

map('', '<Space>', '<Nop>', opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Window Navigate
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- ctrl+s to save
map('n', '<C-s>', ':w <CR>', opts)
map('i', '<C-s>', '<Esc> :w <CR>i', opts)
map('v', '<C-s>', '<Esc> :w <CR>', opts)

-- ctrl+z
map('n', '<C-z>', ':u <CR>', opts)
map('i', '<C-z>', '<Esc> :u <CR>i', opts)

-- Delete without copy
map('v', 'D', '"_d', opts)

-- Lualine
map('n', '<M-l>', ':bn <CR>', opts)
map('n', '<M-h>', ':bp <CR>', opts)
