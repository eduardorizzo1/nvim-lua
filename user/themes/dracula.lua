local colors = require("user.themes.colors").color
local opts = {
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

		-- Bufferline
		BufferLineIndicatorSelected = { fg = colors.purple },
		BufferLineFill = { bg = colors.bg_dark },
		BufferLineBufferSelected = { bg = "none" },
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

		-- Treesitter
		["@keyword.function"] = { fg = colors.pink },
		["@property"] = { fg = colors.fg },
		["@variable"] = { fg = colors.purple },
		["@punctuation.delimiter"] = { fg = colors.pink },
		["@punctuation.special"] = { fg = colors.pink },
		["@string.escape"] = { fg = colors.pink },
		["@text"] = { fg = colors.fg },
		["@text.title"] = { fg = colors.fg },
	},
}

return {
  "Mofiqul/dracula.nvim",
  config = function ()
    require('dracula').setup(opts)
  end
}