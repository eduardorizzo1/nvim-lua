local cmd = vim.cmd

cmd([[ colo kanagawa ]])

cmd([[ hi NvimTreeVertSplit guifg=#16161d ]])
cmd([[ hi VertSplit guibg=#1f1f28]])
cmd([[ hi LineNr guibg=#1f1f28]])
cmd([[ hi CursorLineNr guibg=#1f1f28]])
cmd([[ hi SignColumn guibg=#1f1f28]])

cmd([[ hi DiagnosticSignHint guibg=#1f1f28]])
cmd([[ hi DiagnosticSignError guibg=#1f1f28]])
cmd([[ hi DiagnosticSignInformation guibg=#1f1f28]])
cmd([[ hi DiagnosticSignWarning guibg=#1f1f28]])

cmd([[ hi GitSignsAdd guibg=#1f1f28 ]])
cmd([[ hi GitSignsChange guibg=#1f1f28 ]])
cmd([[ hi GitSignsDelete guibg=#1f1f28 ]])
cmd([[ hi GitSignsUntracked guibg=#1f1f28 ]])

cmd([[ hi IndentBlanklineContextStart guifg=#938AA9 ]])
cmd([[ hi IndentBlanklineContextChar guifg=#938AA9 ]])
cmd([[ hi IndentBlanklineIndent1 guifg=#2A2A37 ]])

cmd([[ hi NvimTreeIndentMarker guifg=#6272a4 gui=bold ]])
cmd([[ hi NvimTreeNormal guibg=#16161D ]])
cmd([[ hi NvimTreeNormalNC guibg=#16161D ]])
cmd([[ hi NvimTreeWinSeparator guibg=#16161D guifg=#16161D ]])

vim.opt.laststatus = 3
vim.opt.fillchars:append({
	horiz = "━",
	horizup = "┻",
	horizdown = "┳",
	vert = "┃",
	vertleft = "┨",
	vertright = "┣",
	verthoriz = "╋",
})

require("kanagawa").setup({
	globalStatus = true,
})
