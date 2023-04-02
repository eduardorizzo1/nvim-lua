local cmd = vim.cmd
local colors = require("user.themes.colorscheme").color

local dracula = require("dracula")

dracula.setup({
	italic_comment = true,
	overrides = {
		Search = { fg = "#000000", bg = colors.green },
		Title = { fg = colors.green },
		Number = { fg = colors.purple },
		Function = { fg = colors.green },
		Keyword = { fg = colors.pink },
		Keywords = { fg = colors.purple },
		MatchParen = { fg = "#ffffff", bg = colors.bg_dark, underline = true, bold = true },
		NormalFloat = { fg = colors.purple },
		LineNr = { fg = colors.purple_alt },
		CursorLineNr = { fg = colors.cyan },

		-- Bufferline
		BufferLineIndicatorSelected = { fg = colors.purple },
		BufferLineFill = { bg = colors.bg_dark },
		BufferLineBufferSelected = { bg = "none" },

		-- NvimTree
		NvimTreeOpenedFolderName = { fg = colors.purple },
		NvimTreeIndentMarker = { fg = colors.comment },

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

		-- Pmenu
		Pmenu = { bg = colors.bg, fg = colors.fg },
		PmenuSel = { bg = colors.current_line, fg = colors.cyan },
		PmenuSbar = { bg = colors.bg },
		PmenuThumb = { bg = colors.current_line },

		-- IndentBlankLine
		IndentBlanklineContextStart = { fg = colors.purple },
		IndentBlanklineContextChar = { fg = colors.purple },
		IndentBlanklineIndent1 = { fg = colors.bg },

		-- Ts Rainbow
		rainbowcol1 = { fg = "#ffff00" },
		rainbowcol2 = { fg = colors.pink },
		rainbowcol3 = { fg = colors.cyan },
		rainbowcol4 = { fg = colors.green },
		rainbowcol5 = { fg = colors.purple },
		rainbowcol6 = { fg = colors.orange },

		-- Cmp
		CmpItemAbbrMatch = { bg = colors.bg, fg = colors.pink },
		CmpItemKindMethod = { bg = colors.bg, fg = colors.pink },
		CmpItemMenu = { bg = colors.bg, fg = colors.comment, bold = true },
		CmpItemKindFile = { bg = colors.bg, fg = colors.green },
		CmpItemKindFolder = { bg = colors.bg, fg = colors.yellow },

		-- Debug
		debugPc = { bg = colors.bg },

		-- Treesitter
		["@keyword.function"] = { fg = colors.pink },
		["@property"] = { fg = colors.fg },
		["@variable"] = { fg = colors.purple },
		["@punctuation.delimiter"] = { fg = colors.pink },
		["@punctuation.special"] = { fg = colors.pink },
		["@string.escape"] = { fg = colors.pink },
		["@text"] = { fg = colors.fg },
	},
})

cmd([[ colo dracula ]])
