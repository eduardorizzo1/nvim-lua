local colors = require("utils.colors").color

local M = {}
M.transparent = true

M.init = function()
	vim.cmd([[ colo dracula ]])
	if M.transparent then
		vim.cmd([[ hi CursorLine guibg=#282a36]])
		vim.cmd([[ hi CursorLineNr cterm=bold guifg=#8be9fd gui=bold ]])
		vim.cmd([[ hi BufferLineOffsetSeparator guibg=NONE guifg=#564f8b ]])
		vim.cmd([[ hi NvimTreeCursorLine guibg=#282a36]])
		vim.cmd([[ hi NvimTreeStatusLine guibg=NONE guifg=NONE]])
		vim.cmd([[ hi NvimTreeStatusLineNC guibg=NONE guifg=#564f8b ]])
		vim.cmd([[ hi NvimTreeWinSeparator guifg=#564f8b guibg=NONE]])
		vim.cmd([[ hi EndOfBuffer guifg=#282a36 ]])
	end
end

M.opts = {
	transparent_bg = M.transparent,
	italic_comment = true,
	lualine_bg_color = "#16161d",
	overrides = {
		Search = { fg = colors.green, bg = colors.comment, bold = true },
		Title = { fg = colors.green },
		Number = { fg = colors.purple },
		Function = { fg = colors.green },
		Keyword = { fg = colors.pink },
		Keywords = { fg = colors.purple },
		MatchParen = { fg = "#ffffff", bg = colors.bg_dark, underline = true, bold = true },
		NormalFloat = { fg = colors.purple },
		LineNr = { fg = colors.purple_alt },
		CursorLine = { bg = colors.current_line_alt },
		CursorLineNr = { fg = colors.cyan },
		VertSplit = { fg = colors.purple_alt },
		Directory = { fg = colors.comment, bg = colors.bg_dark },
		Folded = { bg = colors.bg_dark, fg = colors.comment },

		-- Semantic
		["@class"] = { fg = colors.cyan },
		["@struct"] = { fg = colors.cyan },
		["@enum"] = { fg = colors.cyan },
		["@enumMember"] = { fg = colors.purple },
		["@event"] = { fg = colors.cyan },
		["@interface"] = { fg = colors.cyan },
		["@modifier"] = { fg = colors.cyan },
		["@regexp"] = { fg = colors.yellow },
		["@typeParameter"] = { fg = colors.cyan },
		["@decorator"] = { fg = colors.cyan },

		-- -- Treesitter
		["@keyword.function"] = { fg = colors.pink },
		["@property"] = { fg = colors.fg },
		["@variable"] = { fg = colors.purple },
		["@punctuation.delimiter"] = { fg = colors.pink },
		["@punctuation.special"] = { fg = colors.pink },
		-- ["@punctuation.bracket"] = { fg = "#ffff00" },
		["@string.escape"] = { fg = colors.pink },
		["@text"] = { fg = colors.fg },
		["@tag"] = { fg = colors.pink },
		["@text.title"] = { fg = colors.fg },

		-- Bufferline
		BufferLineFill = { bg = colors.bg_dark },
		BufferLineBackground = { fg = M.transparent and colors.current_line or colors.comment },
		BufferLineBufferVisible = { bg = M.transparent and "none" or colors.bg, fg = colors.fg },
		BufferLineBufferSelected = { bg = M.transparent and "none" or colors.bg, italic = true, bold = true },
		BufferLineDuplicate = { fg = M.transparent and colors.bg or colors.comment },
		BufferLineDuplicateSelected = { fg = colors.comment, bold = false, italic = false },
		BufferLineIndicatorSelected = { fg = colors.purple },
		BufferLineSeparator = { bg = M.transparent and "none" or colors.bg_dark, fg = colors.bg_dark },
		BufferLineSeparatorSelected = { bg = M.transparent and "none" or colors.bg, fg = colors.bg_dark },
		BufferLineSeparatorVisible = { bg = M.transparent and "none" or colors.bg, fg = colors.bg_dark },
		BufferLineOffsetSeparator = { fg = colors.bg_dark, bg = colors.bg_dark },
		BufferLineCloseButtonSelected = { bg = M.transparent and "none" or colors.bg, fg = colors.fg },

		-- NvimTree
		NvimTreeOpenedFolderName = { fg = colors.purple },
		-- NvimTreeOpenedFile = { fg = colors.fg, bg = colors.current_line },
		NvimTreeFolderArrowClosed = { fg = colors.comment, bg = "none" },
		NvimTreeFolderArrowOpen = { fg = colors.comment, bg = "none" },
		NvimTreeIndentMarker = { fg = colors.comment },
		NvimTreeWinSeparator = { fg = colors.bg_dark_alt, bg = colors.bg_dark_alt },
		NvimTreeWindowPicker = { fg = colors.green, bg = colors.current_line, bold = true },

		-- Telescope
		TelescopeNormal = { bg = M.transparent and "none" or colors.bg, fg = colors.fg },
		TelescopeMatching = { fg = colors.pink },
		TelescopeSelection = { fg = colors.white, bg = colors.rounded_fg, bold = true },
		TelescopePreviewBorder = { fg = colors.fg, bg = "none" },
		TelescopeResultsBorder = { fg = colors.fg, bg = "none" },
		TelescopePromptBorder = { fg = colors.fg, bg = "none" },
		TelescopePromptCounter = { fg = colors.fg, bg = colors.current_line_alt },
		TelescopeSelectionCaret = { bold = true },

		-- Lsp
		LspReferenceRead = { bg = colors.current_line, fg = "none" },
		LspReferenceText = { bg = colors.current_line, fg = "none" },
		LspReferenceWrite = { bg = colors.current_line, fg = "none" },

		--LSP Saga
		LspFloatWinNormal = { fg = colors.fg },
		LspFloatWinBorder = { fg = colors.comment },
		LspSagaHoverBorder = { fg = colors.comment },
		LspSagaSignatureHelpBorder = { fg = colors.comment },
		LspSagaCodeActionBorder = { fg = colors.comment },
		LspSagaDefPreviewBorder = { fg = colors.comment },
		LspLinesDiagBorder = { fg = colors.comment },
		LspSagaRenameBorder = { fg = colors.comment },
		LspSagaBorderTitle = { fg = colors.pink },
		LSPSagaDiagnosticTruncateLine = { fg = colors.comment },
		LspSagaDiagnosticBorder = { fg = colors.comment },
		LspSagaShTruncateLine = { fg = colors.comment },
		LspSagaDocTruncateLine = { fg = colors.comment },
		LspSagaLspFinderBorder = { fg = colors.comment },
		DiagnosticVirtualTextError = { bg = colors.current_line_alt, fg = colors.red },
		DiagnosticVirtualTextHint = { bg = colors.current_line_alt, fg = colors.cyan },
		DiagnosticVirtualTextInfo = { bg = colors.current_line_alt, fg = colors.cyan },
		DiagnosticVirtualTextWarn = { bg = colors.current_line_alt, fg = colors.yellow },
		CodeActionNumber = { bg = "NONE", fg = colors.cyan },

		-- Pmenu
		Pmenu = { bg = M.transparent and "none" or colors.bg, fg = colors.fg },
		PmenuSel = { bg = colors.current_line, fg = colors.cyan, bold = true },
		PmenuSbar = { bg = colors.bg },
		PmenuThumb = { bg = colors.current_line },

		-- IndentBlankLine
		IndentBlanklineContextStart = { fg = colors.comment },
		IndentBlanklineContextChar = { fg = colors.comment },
		IndentBlanklineIndent1 = { fg = M.transparent and "#222222" or "#393942" },
		-- Indentscope
		MiniIndentscopeSymbol = { fg = colors.comment },

		-- Ts Rainbow
		RainbowDelimiterYellow = { fg = "#ffff00" },
		RainbowDelimiterPink = { fg = colors.pink },
		RainbowDelimiterCyan = { fg = colors.cyan },
		RainbowDelimiterGreen = { fg = colors.green },
		RainbowDelimiterPurple = { fg = colors.purple },
		RainbowDelimiterOrange = { fg = colors.orange },
		RainbowDelimiterBlue = { fg = colors.blue },
		RainbowDelimiterRed = { fg = colors.red },

		-- Cmp
		CmpItemAbbrMatch = { bg = M.transparent and "none" or colors.bg, fg = colors.pink },
		CmpItemKindMethod = { bg = M.transparent and "none" or colors.bg, fg = colors.pink },
		CmpItemMenu = { bg = M.transparent and "none" or colors.bg, fg = colors.comment, bold = true },
		CmpItemKindFile = { bg = M.transparent and "none" or colors.bg, fg = colors.green },
		CmpItemKindFolder = { bg = M.transparent and "none" or colors.bg, fg = colors.yellow },
		CmpItemKindSnippet = { fg = colors.yellow },

		-- Fidget
		FidgetTask = { fg = colors.comment, italic = true },
		FidgetTitle = { fg = colors.green, italic = true, bold = true },

		-- Debug
		debugPc = { bg = colors.bg },
	},
}

return M
