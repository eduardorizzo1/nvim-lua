local wk = require('which-key')
local mappings = {
	q = {":q<CR>", "Quit"},
	w = {":w<CR>", "Save"}
}

local opts = { prefix = '<leader>'}
wk.register(mappings, opts)
