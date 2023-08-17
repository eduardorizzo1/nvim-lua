local colors = require("utils.colors").color

local dracula = {
  "Mofiqul/dracula.nvim",
	lazy = false,
	opts = {
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
	},
	init = function()
		vim.cmd([[ colo dracula ]])
	end
}

local tokyonight = {
  "folke/tokyonight.nvim",
  lazy = false,
  opts = {
    style = "moon" ,
	  transparent = false,
	  styles = {
	  	comments = { italic = false },
	  	keywords = { italic = true },
	  	functions = {},
	  	variables = {},
	  	sidebars = "dark",
	  	floats = "dark",
	  },

	  on_highlights = function(hl, c)
	  	local prompt = "#ff00ff"
	  	hl.TelescopeNormal = {
	  		bg = c.bg_dark,
	  		fg = c.fg_dark,
	  	}
	  	hl.TelescopeBorder = {
	  		bg = c.bg_dark,
	  		fg = c.bg_dark,
	  	}
	  	hl.TelescopePromptNormal = {
	  		bg = prompt,
	  	}
	  	hl.TelescopePromptBorder = {
	  		bg = prompt,
	  		fg = prompt,
	  	}
	  	hl.TelescopePromptTitle = {
	  		bg = prompt,
	  		fg = prompt,
	  	}
	  	hl.TelescopePreviewTitle = {
	  		bg = c.bg_dark,
	  		fg = c.bg_dark,
	  	}
	  	hl.TelescopeResultsTitle = {
	  		bg = c.bg_dark,
	  		fg = c.bg_dark,
	  	}
	  end,
  },
	init = function()
		vim.cmd([[ colo tokyonight ]])
		vim.cmd([[ hi NvimTreeVertSplit guifg=#1f2335 guibg=#1f2335 ]])
		vim.cmd([[ hi NvimTreeFolderIcon guifg=#7aa2f7 gui=bold]])
		vim.cmd([[ hi NvimTreeOpenedFolderName guifg=#bb9af7 gui=bold]])
		vim.cmd([[ hi NvimTreeRootFolder guifg=#6272a4 gui=bold]])
		vim.cmd([[ hi NvimTreeOpenedFile guifg=#73daca guibg=NONE gui=bold]])
		vim.cmd([[ hi IndentBlanklineContextStart guifg=#BB9AF7 gui=none]])
		vim.cmd([[ hi IndentBlanklineContextChar guifg=#BB9AF7 gui=none]])
		vim.cmd([[ hi IndentBlanklineIndent1 guifg=#333952 gui=nocombine]])
	end
}

return dracula