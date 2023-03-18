local g = vim.g
local cmd = vim.cmd
local colors = require("user.themes.colorscheme").color

local dracula = require("dracula")

dracula.setup({
	transparent_bg = true,
	italic_comment = true,
	overrides = {
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
		rainbowcol1 = { fg = colors.yellow },
		rainbowcol2 = { fg = colors.pink },
		rainbowcol3 = { fg = colors.cyan },
		rainbowcol4 = { fg = colors.green },
		rainbowcol5 = { fg = colors.purple },
		rainbowcol6 = { fg = colors.blue },
		rainbowcol7 = { fg = colors.white },

		-- Cmp
		CmpItemAbbrMatch = { bg = colors.bg, fg = colors.pink },

		Search = { fg = "#000000", bg = colors.green },
		Title = { fg = colors.green },
		Number = { fg = colors.purple },
	},
})

cmd([[ colo dracula ]])

---------------------
---- Dracula/vim ----
---------------------
-- g.dracula_show_end_of_buffer = false
-- g.dracula_transparent_bg = false
-- g.dracula_italic = false
-- g.dracula_italic_comment = true
-- g.dracula_show_end_of_buffer = false
-- g.dracula_transparent_bg = false
-- g.dracula_italic = false
-- g.dracula_italic_comment = true
-- g.dracula_underline = 1
-- g.dracula_undercurl = 1
-- g.dracula_show_end_of_buffer = nil

-- cmd([[ hi SignColumn guibg=NONE ]])
-- cmd([[ hi LineNr guifg=#564f8b gui=bold ]])
-- cmd([[ hi CursorLine guibg=#212136 ]])
-- cmd([[ hi CursorLineNr guifg=#564f8b gui=bold ]])
--
-- -- Nvim-tree
-- cmd([[ hi NvimTreeFolderName guifg=#f8f8f2 gui=bold ]])
-- cmd([[ hi NvimTreeFolderIcon guifg=#bd93f9 gui=bold ]])
-- cmd([[ hi NvimTreeOpenedFolderName guifg=#bd93f9 gui=bold ]])
-- cmd([[ hi NvimTreeRootFolder guifg=#6272a4 gui=bold ]])
-- cmd([[ hi NvimTreeIndentMarker guifg=#6272a4 gui=bold ]])
--
-- -- Indent-Blankline
-- cmd([[ hi IndentBlanklineContextStart guifg=#564f8b ]])
-- cmd([[ hi IndentBlanklineContextChar guifg=#564f8b ]])
-- cmd([[ hi IndentBlanklineIndent1 guifg=#282a36 ]])
--
-- -- Telescope
-- cmd([[ hi TelescopeSelection guifg=#fff gui=bold ]])
--
-- -- Git
-- cmd([[ hi GitSignsDelete guibg=NONE guifg=#ff5555 ]])
