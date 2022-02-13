local cmd = vim.cmd
local g = vim.g

cmd[[ hi CursorLine guibg=NONE ]]
cmd[[ hi CursorLineNR cterm=bold guifg=#fff gui=bold ]]
cmd[[ hi Normal guibg=NONE ]]
cmd[[ hi EndOfBuffer guibg=#000  ]]
cmd[[ hi CursorLine guibg=NONE ]]
cmd[[ hi SignColumn guibg=NONE ]]

-- Nvimtree
cmd[[ hi NvimTreeNormal guibg=NONE ]]
cmd[[ hi NvimTreeVertSplit guibg=NONE ]]
cmd[[ hi NvimTreeEndOfBuffer guifg=NONE ]]


if (vim.g.neosolarized) then
	vim.cmd[[ hi CursorLine guibg=#073642]]
end
