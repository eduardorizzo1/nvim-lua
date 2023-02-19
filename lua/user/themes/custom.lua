local cmd = vim.cmd
local g = vim.g

g.tokyonight_transparent = true
g.tokyonight_transparent_sidebar = true
g.dracula_transparent_bg = true

cmd([[ hi SignColumn guibg=NONE ]])
cmd([[ hi Normal guibg=NONE ]])
cmd([[ hi NormalNC guibg=NONE ]])
cmd([[ hi EndOfBuffer ctermfg=NONE guifg=NONE guibg=NONE ctermbg=NONE ]])
cmd([[ hi NonText guifg=NONE guibg=NONE ctermbg=NONE ctermfg=NONE ]])

-- Nvimtree
cmd([[ hi NvimTreeNormal guibg=NONE ]])
cmd([[ hi NvimTreeNormalNC guibg=NONE ]])
cmd([[ hi NvimTreeVertSplit guibg=NONE ]])
cmd([[ hi NvimTreeEndOfBuffer guifg=NONE ]])
-- cmd([[ hi NvimTreeStatusLineNC guibg=NONE guifg=NONE ]])
-- cmd([[ hi NvimTreeStatusLine guibg=NONE guifg=NONE ]])

if g.colors_name == "dracula" then
	cmd([[ hi CursorLineNR cterm=bold guifg=#8be9fd gui=bold ]])
	cmd([[ hi CursorLine guibg=#282a36]])
	cmd([[ hi NvimTreeWinSeparator guibg=#282a36 guifg=#564f8b ]])
	cmd([[ hi WinSeparator guibg=NONE guifg=#564f8b ]])
	cmd([[ hi BufferLineOffsetSeparator guibg=#282a36 guifg=#564f8b ]])
	cmd([[ hi NvimTreeStatusLineNC guibg=#282a36 guifg=#564f8b ]])
	cmd([[ hi NvimTreeStatusLine guibg=#282a36 guifg=NONE]])
	cmd([[ hi EndOfBuffer guifg=#564f8b guibg=NONE  ]])
end

if g.neosolarized then
	cmd([[ hi CursorLine guibg=#073642]])
end

if g.tokyonight_transaparent then
	cmd([[ hi LineNr cterm=bold guibg=#24283b ]])
end
