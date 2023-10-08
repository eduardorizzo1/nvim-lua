local M = {}

M.opts = {
	globalStatus = true,
}

M.init = function()
	vim.cmd([[ colo kanagawa ]])

	vim.cmd([[ hi NvimTreeVertSplit guifg=#16161d ]])
	vim.cmd([[ hi VertSplit guibg=#1f1f28]])
	vim.cmd([[ hi LineNr guibg=#1f1f28]])
	vim.cmd([[ hi CursorLineNr guibg=#1f1f28]])
	vim.cmd([[ hi SignColumn guibg=#1f1f28]])

	vim.cmd([[ hi DiagnosticSignHint guibg=#1f1f28]])
	vim.cmd([[ hi DiagnosticSignError guibg=#1f1f28]])
	vim.cmd([[ hi DiagnosticSignInformation guibg=#1f1f28]])
	vim.cmd([[ hi DiagnosticSignWarning guibg=#1f1f28]])

	vim.cmd([[ hi GitSignsAdd guibg=#1f1f28 ]])
	vim.cmd([[ hi GitSignsChange guibg=#1f1f28 ]])
	vim.cmd([[ hi GitSignsDelete guibg=#1f1f28 ]])
	vim.cmd([[ hi GitSignsUntracked guibg=#1f1f28 ]])

	vim.cmd([[ hi IndentBlanklineContextStart guifg=#938AA9 ]])
	vim.cmd([[ hi IndentBlanklineContextChar guifg=#938AA9 ]])
	-- vim.cmd([[ hi IndentBlanklineIndent1 guifg=#2A2A37 ]])

	vim.cmd([[ hi NvimTreeIndentMarker guifg=#6272a4 gui=bold ]])
	vim.cmd([[ hi NvimTreeNormal guibg=#16161D ]])
	vim.cmd([[ hi NvimTreeNormalNC guibg=#16161D ]])
	vim.cmd([[ hi NvimTreeWinSeparator guibg=#1f1f28 guifg=#1f1f28 ]])
	vim.cmd([[ hi TelescopePromptCounter guibg=#1f1f28 guifg=#E0AF68 ]])

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
end

return M
