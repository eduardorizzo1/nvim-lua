local colors = require("utils.colors").color

local dracula_init = function()
	vim.cmd([[ colo dracula ]])
	-- vim.cmd([[ hi CursorLine guibg=#333952]])
	-- vim.cmd([[ hi CursorLineNr cterm=bold guifg=#8be9fd gui=bold ]])
	-- vim.cmd([[ hi BufferLineOffsetSeparator guibg=NONE guifg=#564f8b ]])
	-- vim.cmd([[ hi NvimTreeWinSeparator guibg=NONE guifg=#564f8b ]])
	-- vim.cmd([[ hi NvimTreeStatusLine guibg=NONE guifg=NONE]])
	-- vim.cmd([[ hi NvimTreeStatusLineNC guibg=NONE guifg=#564f8b ]])
	-- vim.cmd([[ hi EndOfBuffer guifg=#564f8b guibg=NONE  ]])
end

local tokyonight_init = function()
	vim.cmd([[ colo tokyonight ]])
	vim.cmd([[ hi IndentBlanklineContextStart guifg=#7dcfff gui=none]])
	vim.cmd([[ hi IndentBlanklineContextChar guifg=#7dcfff gui=none]])
	vim.cmd([[ hi IndentBlanklineIndent1 guifg=#333952 gui=nocombine]])
end

local kanagawa_init = function()
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
	vim.cmd([[ hi IndentBlanklineIndent1 guifg=#2A2A37 ]])

	vim.cmd([[ hi NvimTreeIndentMarker guifg=#6272a4 gui=bold ]])
	vim.cmd([[ hi NvimTreeNormal guibg=#16161D ]])
	vim.cmd([[ hi NvimTreeNormalNC guibg=#16161D ]])
	vim.cmd([[ hi NvimTreeWinSeparator guibg=#16161D guifg=#16161D ]])

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

local catppuccin_init = function()
	vim.cmd.colorscheme("catppuccin")
	vim.cmd([[ hi SignColumn guibg=NONE ]])
	vim.cmd([[ hi IndentBlanklineContextStart guifg=#CBA6F7 ]])
	vim.cmd([[ hi IndentBlanklineContextChar guifg=#CBA6F7 ]])
	vim.cmd([[ hi IndentBlanklineIndent1 guifg=#101019 ]])
	vim.cmd([[ hi BufferLineOffsetSeparator guibg=NONE]])
end

local dracula = {
	"Mofiqul/dracula.nvim",
	lazy = false,
	opts = {
		transparent_bg = false,
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
			["@string.escape"] = { fg = colors.pink },
			["@text"] = { fg = colors.fg },
			["@text.title"] = { fg = colors.fg },

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
	},
	init = dracula_init,
}

local tokyonight = {
	"folke/tokyonight.nvim",
	lazy = false,
	opts = {
		style = "moon",
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
			hl.TelescopeBorder = {
				bg = c.bg_dark,
				fg = c.blue,
			}
			hl.NvimTreeOpenedFolderName = {
				bg = c.bg_highlight,
				fg = c.magenta,
			}
			hl.NvimTreeOpenedFile = {
				bg = c.bg_dark,
				fg = c.cyan,
			}
		end,
	},
	-- init = tokyonight_init,
}

local kanagawa = {
	"rebelot/kanagawa.nvim",
	opts = {
		globalStatus = true,
	},
	-- init = kanagawa_init,
}

local catppuccin = {
	"catppuccin/nvim",
	name = "catppuccin",
	flavour = "macchiato", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "macchiato",
	},
	transparent_background = false,
	show_end_of_buffer = false, -- show the '~' characters after the end of buffers
	term_colors = false,
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	no_italic = false, -- Force no italic
	no_bold = false, -- Force no bold
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	color_overrides = {},
	custom_highlights = {},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		telescope = true,
		notify = false,
		mini = false,
		indent_blankline = {
			enabled = false,
			colored_indent_levels = false,
		},
	},
	-- init = catppuccin_init,
}

return { dracula, tokyonight, kanagawa, catppuccin }
