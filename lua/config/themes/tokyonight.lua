local M = {}

local transparent = true

M.opts = {
	style = "night",
	transparent = transparent,
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		sidebars = transparent and "transparent" or "dark",
		floats = transparent and "transparent" or "dark",
	},

	on_highlights = function(hl, c)
		hl.CursorLineNr = {
			fg = c.cyan,
		}
		hl.WinSeparator = { fg = c.comment }
		hl["@module.python"] = { fg = c.fg }
		hl["@constructor.python"] = { fg = c.cyan, italic = true }
		hl["@keyword.function.python"] = { fg = c.purple, italic = true }
		hl["@variable.builtin.python"] = { fg = c.red, italic = true }
		hl.Include = { fg = c.purple, italic = true }
		hl.BufferLineBufferVisible = { fg = c.fg }
		hl.BufferLineBufferSelected = { fg = c.fg, italic = true, bold = true }
		hl.SnacksIndentScope = { fg = c.blue }
	end,
}

return M
