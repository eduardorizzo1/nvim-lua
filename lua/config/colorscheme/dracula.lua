local colors = require("utils.colors").color

local M = {}
M.transparent = false

M.init = function()
	vim.cmd([[ colo dracula ]])
	if M.transparent then
		vim.cmd([[ hi CursorLine guibg=#333952]])
		vim.cmd([[ hi CursorLineNr cterm=bold guifg=#8be9fd gui=bold ]])
		vim.cmd([[ hi BufferLineOffsetSeparator guibg=NONE guifg=#564f8b ]])
		vim.cmd([[ hi NvimTreeWinSeparator guibg=NONE guifg=#564f8b ]])
		vim.cmd([[ hi NvimTreeStatusLine guibg=NONE guifg=NONE]])
		vim.cmd([[ hi NvimTreeStatusLineNC guibg=NONE guifg=#564f8b ]])
		vim.cmd([[ hi EndOfBuffer guifg=#564f8b guibg=NONE  ]])
	end
end

M.opts = {
	transparent_bg = M.transparent,
	italic_comment = true,
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
		["@text.title"] = { fg = colors.fg },

		-- Bufferline
		BufferLineIndicatorSelected = { fg = colors.purple },
		BufferLineFill = { bg = "#16171d" },
		BufferLineBufferSelected = { bg = "none", italic = true },
		BufferLineSeparator = { bg = "none" },

		-- NvimTree
		NvimTreeOpenedFolderName = { fg = colors.purple },
		NvimTreeIndentMarker = { fg = colors.comment },
		NvimTreeWinSeparator = { fg = colors.bg_dark, bg = colors.bg_dark },

		-- Telescope
		TelescopeMatching = { fg = colors.pink },
		TelescopeSelection = { fg = colors.white, bg = colors.rounded_fg, bold = true },
		TelescopePreviewBorder = { fg = colors.fg },
		TelescopeResultsBorder = { fg = colors.fg },
		TelescopePromptBorder = { fg = colors.fg },
		TelescopePromptCounter = { bg = colors.rounded_fg },

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
		CodeActionNumber = { bg = "NONE", fg = colors.cyan },

		-- Pmenu
		Pmenu = { bg = colors.bg, fg = colors.fg },
		PmenuSel = { bg = colors.current_line, fg = colors.cyan },
		PmenuSbar = { bg = colors.bg },
		PmenuThumb = { bg = colors.current_line },

		-- IndentBlankLine
		IndentBlanklineContextStart = { fg = colors.comment },
		IndentBlanklineContextChar = { fg = colors.comment },
		IndentBlanklineIndent1 = { fg = "#393942" },
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

		-- Cmp
		CmpItemAbbrMatch = { bg = colors.bg, fg = colors.pink },
		CmpItemKindMethod = { bg = colors.bg, fg = colors.pink },
		CmpItemMenu = { bg = colors.bg, fg = colors.comment, bold = true },
		CmpItemKindFile = { bg = colors.bg, fg = colors.green },
		CmpItemKindFolder = { bg = colors.bg, fg = colors.yellow },
		CmpItemKindSnippet = { fg = colors.yellow },

		-- Debug
		debugPc = { bg = colors.bg },
	},
}

return M
