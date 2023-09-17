local M = {}

local transparent = false

M.opts = {
	style = "moon",
	transparent = false,
	styles = {
		comments = { italic = true },
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
		hl.TelescopePromptCounter = {
			bg = c.bg_dark,
			fg = c.cyan,
		}
		hl.NvimTreeOpenedFolderName = {
			bg = "none",
			fg = c.magenta,
		}
		hl.NvimTreeOpenedFile = {
			bg = "none",
			fg = c.cyan,
		}
		hl.NvimTreeWinSeparator = {
			bg = c.bg,
			fg = c.bg,
		}
		hl.CursorLineNr = {
			fg = c.cyan,
		}
		hl.BufferLineOffsetSeparator = {
			bg = c.bg,
			fg = c.bg_dark,
		}
	end,
}

M.init = function()
	vim.cmd([[ colo tokyonight ]])
	vim.cmd([[ hi IndentBlanklineContextStart guifg=#7dcfff gui=none]])
	vim.cmd([[ hi IndentBlanklineContextChar guifg=#7dcfff gui=none]])
	vim.cmd([[ hi IndentBlanklineIndent1 guifg=#2d3047 gui=nocombine]])

	if transparent then
		vim.cmd([[ hi EndOfBuffer guifg=#564f8b guibg=NONE  ]])

		vim.cmd([[ hi CursorLineNr cterm=bold guifg=#7DCFFF gui=bold ]])

		vim.cmd([[ hi DiagnosticVirtualTextHint guibg=NONE ]])
		vim.cmd([[ hi DiagnosticVirtualTextError guibg=NONE ]])
		vim.cmd([[ hi DiagnosticVirtualTextInfo guibg=NONE ]])
		vim.cmd([[ hi DiagnosticVirtualTextWarn guibg=NONE ]])

		vim.cmd([[ hi GitSignsAdd guibg=NONE ]])
		vim.cmd([[ hi GitSignsChange guibg=NONE ]])
		vim.cmd([[ hi GitSignsDelete guibg=NONE ]])

		vim.cmd([[ hi NvimTreeNormal guibg=NONE ]])
		vim.cmd([[ hi NvimTreeNormalNC guibg=NONE ]])
	end
end

return M
