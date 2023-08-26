local M = {}

M.tokyonight_init = function()
	vim.cmd([[ colo tokyonight ]])
	vim.cmd([[ hi IndentBlanklineContextStart guifg=#7dcfff gui=none]])
	vim.cmd([[ hi IndentBlanklineContextChar guifg=#7dcfff gui=none]])
	vim.cmd([[ hi IndentBlanklineIndent1 guifg=#333952 gui=nocombine]])
end

M.opts = {
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
}

return M
