local M = {}

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
			bg = c.bg_highlight,
			fg = c.magenta,
		}
		hl.NvimTreeOpenedFile = {
			bg = c.bg_highlight,
			fg = c.cyan,
		}
		hl.NvimTreeWinSeparator = {
			bg = c.bg,
			fg = c.bg_dark,
		}
		hl.CursorLineNr = {
			fg = c.orange,
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
	vim.cmd([[ hi IndentBlanklineIndent1 guifg=#333952 gui=nocombine]])
end

return M
