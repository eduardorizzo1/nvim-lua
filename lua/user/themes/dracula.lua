local cmd = vim.cmd
local colors = require("user.themes.colorscheme").color

local dracula = require("dracula")

dracula.setup({
	transparent_bg = true,
	italic_comment = true,
	overrides = {
		Search = { fg = "#000000", bg = colors.green },
		Title = { fg = colors.green },
		Number = { fg = colors.purple },
		Function = { fg = colors.green },
		Keyword = { fg = colors.pink },
		Keywords = { fg = colors.purple },
		MatchParen = { fg = "#ffffff", bg = colors.bg_dark, underline = true, bold = true },

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
		PmenuThumb = { bg = colors.bg },

		-- IndentBlankLine
		IndentBlanklineContextStart = { fg = colors.purple_alt },
		IndentBlanklineContextChar = { fg = colors.purple_alt },
		IndentBlanklineIndent1 = { fg = colors.bg },

		-- Ts Rainbow
		rainbowcol1 = { fg = "#ff0000" },
		rainbowcol2 = { fg = "#0077ff" },
		rainbowcol3 = { fg = "#00ff00" },
		rainbowcol4 = { fg = "#ff00ff" },
		rainbowcol5 = { fg = "#00ffff" },
		rainbowcol6 = { fg = "#9900ff" },
		rainbowcol7 = { fg = "#ffff00" },

		-- Cmp
		CmpItemAbbrMatch = { bg = colors.bg, fg = colors.pink },

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
