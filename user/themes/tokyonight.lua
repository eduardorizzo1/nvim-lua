-- vim.cmd([[ colo tokyonight ]])

local opts = {
	style = "moon",
	transparent = false,
	styles = {
		comments = { italic = false },
		keywords = { italic = true },
		functions = {},
		variables = {},
		-- Background styles. Can be "dark", "transparent" or "normal"
		sidebars = "dark", -- style for sidebars, see below
		floats = "dark", -- style for floating windows
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
}

return {
  'folke/tokyonight.nvim',
  config = function ()
    require('tokyonight').setup(opts)
  end
}

-- vim.cmd([[ hi NvimTreeVertSplit guifg=#1f2335 guibg=#1f2335 ]])
-- vim.cmd([[ hi NvimTreeFolderIcon guifg=#7aa2f7 gui=bold]])
-- vim.cmd([[ hi NvimTreeOpenedFolderName guifg=#bb9af7 gui=bold]])
-- vim.cmd([[ hi NvimTreeRootFolder guifg=#6272a4 gui=bold]])
-- vim.cmd([[ hi NvimTreeOpenedFile guifg=#73daca guibg=NONE gui=bold]])
-- vim.cmd([[ hi IndentBlanklineContextStart guifg=#BB9AF7 gui=none]])
-- vim.cmd([[ hi IndentBlanklineContextChar guifg=#BB9AF7 gui=none]])
-- vim.cmd([[ hi IndentBlanklineIndent1 guifg=#333952 gui=nocombine]])