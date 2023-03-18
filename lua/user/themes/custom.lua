local cmd = vim.cmd
local g = vim.g

cmd([[ hi LineNr guibg=NONE guifg=#564f8b gui=bold ]])
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
cmd([[ hi NvimTreeWinSeparator guibg=NONE guifg=NONE ]])

-- Telescope
cmd([[ hi TelescopeNormal guibg=NONE ]])

if g.colors_name == "dracula" then
	g.dracula_transparent_bg = true
	cmd([[ hi CursorLine guibg=#333952]])
	cmd([[ hi CursorLineNr cterm=bold guifg=#8be9fd gui=bold ]])
	cmd([[ hi BufferLineOffsetSeparator guibg=NONE guifg=#564f8b ]])
	cmd([[ hi NvimTreeWinSeparator guibg=NONE guifg=#564f8b ]])
	cmd([[ hi NvimTreeStatusLine guibg=NONE guifg=NONE]])
	cmd([[ hi NvimTreeStatusLineNC guibg=NONE guifg=#564f8b ]])
	cmd([[ hi EndOfBuffer guifg=#564f8b guibg=NONE  ]])
end

if g.colors_name == "tokyonight" then
	g.tokyonight_transparent = true
	g.tokyonight_transparent_sidebar = true
	cmd([[ hi EndOfBuffer guifg=#564f8b guibg=NONE  ]])

	cmd([[ hi CursorLineNr cterm=bold guifg=#7DCFFF gui=bold ]])

	cmd([[ hi DiagnosticVirtualTextHint guibg=NONE ]])
	cmd([[ hi DiagnosticVirtualTextError guibg=NONE ]])
	cmd([[ hi DiagnosticVirtualTextInfo guibg=NONE ]])
	cmd([[ hi DiagnosticVirtualTextWarn guibg=NONE ]])

	cmd([[ hi GitSignsAdd guibg=NONE ]])
	cmd([[ hi GitSignsChange guibg=NONE ]])
	cmd([[ hi GitSignsDelete guibg=NONE ]])
	cmd([[ hi GitSignsUntracked guibg=NONE ]])
end

if g.colors_name == "kanagawa" then
	cmd([[ hi NvimTreeWinSeparator guibg=NONE guifg=#16161D ]])
	cmd([[ hi NvimTreeStatusLineNC guibg=NONE guifg=#16161D ]])
	cmd([[ hi NvimTreeStatusLine guibg=NONE guifg=NONE]])
	cmd([[ hi BufferLineOffsetSeparator guibg=#fff guifg=#fff]])
end

if g.colors_name == "catppuccin" then
	cmd([[ hi CursorLineNr cterm=bold guifg=#7DC4E4 gui=bold ]])
end

if g.neosolarized then
	cmd([[ hi CursorLine guibg=#073642]])
end
