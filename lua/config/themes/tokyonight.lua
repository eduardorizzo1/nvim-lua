local M = {}

local transparent = true
local custom_bg = "#1E2030"
local custom_fg = "#2f334d"

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

		--=========== [ Develop ] ================
		hl["@module.python"] = { fg = c.fg }
		hl["@constructor.python"] = { fg = c.cyan, italic = true }
		hl["@keyword.function.python"] = { fg = c.purple, italic = true }
		hl.Include = { fg = c.purple, italic = true }

		--=========== [ NvimTree ] ================
		hl.NvimTreeOpenedFolderName = {
			bg = c.bg_highlight,
			fg = c.blue,
			bold = true,
		}
		hl.NvimTreeOpenedFolderIcon = {
			bg = c.bg_highlight,
			fg = c.blue,
			bold = true,
		}
		hl.NvimTreeOpenedFile = {
			bg = c.none,
			fg = c.cyan,
		}
		hl.NvimTreeWinSeparator = {
			bg = c.bg,
			fg = transparent and c.comment or c.bg,
		}
		hl.NvimTreeFolderIcon = {
			fg = c.blue,
		}

		--============ [ Telescope ] ================
		hl.TelescopeBorder = {
			bg = transparent and c.none or c.bg_dark,
			fg = c.blue,
		}
		hl.TelescopePromptBorder = {
			bg = transparent and c.none or c.bg_dark,
			fg = c.blue,
		}
		hl.TelescopePromptTitle = {
			bg = transparent and c.none or c.bg_dark,
			fg = c.blue,
		}
		hl.TelescopePromptCounter = {
			bg = c.bg_dark,
			fg = c.cyan,
		}
		hl.TelescopeMatching = { fg = c.blue, bold = true }
		hl.TelescopeSelection = { bg = c.bg_highlight, bold = true }

		--============ [ Bufferline ] =================
		hl.BufferLineFill = transparent and {
			bg = custom_bg,
		} or {}
		hl.BufferLineBackground = transparent and {
			fg = custom_fg,
		} or {}
		hl.BufferLineOffsetSeparator = {
			bg = c.bg,
			fg = c.bg_dark,
		}
		hl.BufferLineSeparator = transparent and {
			fg = custom_bg,
		} or {}
		hl.BufferLineSeparatorSelected = transparent and {
			fg = custom_bg,
		} or {}
		hl.BufferLineSeparatorVisible = transparent and {
			fg = custom_bg,
		} or {}
		hl.BufferLineBufferVisible = { fg = c.fg }
		hl.BufferLineBufferSelected = { fg = c.fg, italic = true, bold = true }
		hl.BufferLineTab = transparent and { fg = c.comment, bg = custom_bg } or {}
		hl.BufferLineTabSeparator = transparent and { fg = custom_bg, bg = custom_bg } or {}
		hl.BufferLineTabSeparatorSelected = transparent and { fg = custom_bg } or {}

		--=============== [ Cmp ] ====================
		hl.Pmenu = transparent and {
			bg = c.none,
		} or {}

		--=============== [ Cmp ] ====================
		hl.StatusLine = transparent and {
			bg = c.none,
		} or {}
	end,
}

return M
