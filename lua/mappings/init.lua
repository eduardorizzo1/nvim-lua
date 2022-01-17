local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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

-- ctrl+q to quit
map('n', '<C-q>', ':q<CR>', opts)

-- Toggle highlight match word
map('n', '<leader>*', ':noh', opts)

-- Lualine
map('n', '<M-l>', ':bn <CR>', opts)
map('n', '<M-h>', ':bp <CR>', opts)

-- Prettier
map('n', '<leader>p', ':PrettierAsync<cr>', opts)  

-- Telescope
map('n', '<c-p>', '<cmd>lua require("telescope.builtin").find_files()<cr>', opts)
map('n', ',ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', opts)
map('n', ',fg','<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
map('n', ',fb','<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
map('n', ',fh','<cmd>lua require("telescope.builtin").help_tags()<cr>', opts)
map('n', ',gg','<cmd>lua require("telescope.builtin").git_status()<cr>', opts)

