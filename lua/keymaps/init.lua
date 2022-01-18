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
map('i', '<C-s>', '<Esc> :w <CR>l', opts)
map('v', '<C-s>', '<Esc> :w <CR>', opts)

-- ctrl+z
map('n', '<C-z>', ':u <CR>', opts)
map('i', '<C-z>', '<Esc> :u <CR>', opts)

-- Delete without copy
map('v', 'D', '"_d', opts)

-- ctrl+q to quit
map('n', '<C-q>', ':q <CR>', opts)

-- Toggle highlight match word
map('n', '<space>*', ':noh <CR>', opts)

-- Toggle Relative number
map('n', '<C-k>n', ':set relativenumber! <CR>', opts)

------------------ P L U G I N S --------------------------

-- Nvimtree
map('n', '<C-b>', ':NvimtreeToggle <CR>', opts)

-- IndentLine
map('n', '<C-k>i', ':IndentBlanklineToggle <CR>', opts)

-- Twilight
map('n', '<C-k>t', ':Twilight <CR>', opts)

-- Zen-mode
map('n', '<C-k>z', ':ZenMode <CR>', opts)

-- Bufferline
map('n', '<M-l>', ':bn <CR>', opts)
map('n', '<M-h>', ':bp <CR>', opts)
map('n', '<M-x>', ':bd <Esc> :bp <CR>', opts)

-- Prettier
map('n', '<space>p', ':PrettierAsync<cr>', opts)  

-- Telescope
map('n', '<c-p>', '<cmd>lua require("telescope.builtin").find_files()<cr>', opts)
map('n', ',ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', opts)
map('n', ',fg','<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
map('n', ',fb','<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
map('n', ',fh','<cmd>lua require("telescope.builtin").help_tags()<cr>', opts)
map('n', ',gg','<cmd>lua require("telescope.builtin").git_status()<cr>', opts)

-- LspSaga Mappings
map('n', 'gc', '<cmd>Lspsaga code_action<CR>', opts)
map('n', 'ga', '<cmd>Lspsaga range_code_action<CR>', opts)
map('n', 'gh', '<cmd>Lspsaga hover_doc<CR>', opts)
map('n', 'gd', '<cmd>Lspsaga preview_definition<CR>', opts)
map('n', 'gi', '<cmd>Lspsaga implement<CR>', opts)
map('n', 'gf', '<cmd>Lspsaga lsp_finder<CR>', opts)
map('n', 'gn', '<cmd>Lspsaga rename<CR>', opts)
map('n', 'gt', '<cmd>Lspsaga open_floaterm<CR>', opts)
map('n', 'gq', '<cmd>Lspsaga close_floaterm<CR>', opts)
map('n', 'gj', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
map('n', 'gk', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
map('n', '<C-k>', '<cmd>Lspsaga signature_help<CR>', opts)

-- Lsp Mappings (See `:help vim.lsp.*` for documentation on any of the below functions)
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
map('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
map('n', '<space>i', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
map('n', '<space>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

