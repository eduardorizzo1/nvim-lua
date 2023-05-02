local lualine_ok, lualine = pcall(require, "lualine")
if not lualine_ok then
	return
end

local icons = require("user.icons")
local colors = require("user.themes.colorscheme").color
local mode_color = require("user.themes.colorscheme").mode_color

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

-- =============================================
-- ================ Bubbles ====================
-- =============================================

local config_bubbles = {
	options = {
		globalstatus = true,
		disabled_filetypes = { "packer" },
		component_separators = "",
		section_separators = "",
		-- fmt = string.lower,
		theme = {
			normal = { c = { fg = colors.fg, bg = "none" } },
			inactive = { c = { fg = colors.fg, bg = "none" } },
		},
	},
	sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
}

local function ins_left(component)
	table.insert(config_bubbles.sections.lualine_c, component)
end

local function ins_right(component)
	table.insert(config_bubbles.sections.lualine_x, component)
end

--------------------------- LEFT ----------------------------------
ins_left({
	function()
		return icons.left_half_ball
	end,
	color = { fg = colors.rounded_fg, bg = "none" },
	padding = { left = 0, right = 0 },
})

ins_left({
	"mode",
	icon = " ",
	color = function()
		return { fg = mode_color[vim.fn.mode()], bg = colors.rounded_fg }
	end,
	padding = { right = 1, left = 1 },
})

ins_left({
	function()
		return icons.right_half_ball
	end,
	color = { fg = colors.rounded_fg, bg = "none" },
	padding = { left = 0, right = 1 },
})

----------------
ins_left({
	function()
		return icons.left_half_ball
	end,
	color = { fg = colors.rounded_fg, bg = "none" },
	padding = { left = 0, right = 0 },
})

ins_left({
	"filename",
	cond = conditions.buffer_not_empty,
	color = { fg = colors.green, bg = colors.rounded_fg },
	padding = { right = 1, left = 1 },
})

ins_left({
	function()
		return icons.right_half_ball
	end,
	color = { fg = colors.rounded_fg, bg = "none" },
	padding = { right = 1 },
})

----------------
ins_left({
	function()
		return icons.left_half_ball
	end,
	cond = conditions.check_git_workspace,
	color = { fg = colors.rounded_fg, bg = "none" },
	padding = { left = 0, right = 0 },
})

ins_left({
	"branch",
	icon = "",
	cond = conditions.check_git_workspace,
	color = { fg = colors.cyan, bg = colors.rounded_fg },
	padding = { right = 1, left = 1 },
})

ins_left({
	function()
		return icons.right_half_ball
	end,
	cond = conditions.check_git_workspace,
	color = { fg = colors.rounded_fg, bg = "none" },
	padding = { left = 0, right = 0 },
})

ins_left({
	"diff",
	symbols = {
		added = "+",
		modified = "~",
		removed = "-",
	},
	diff_color = {
		added = { fg = colors.green },
		modified = { fg = colors.orange },
		removed = { fg = colors.red },
	},
	cond = conditions.hide_in_width,
})

---------------------------RIGHT----------------------------------
ins_right({
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = {
		error = icons.error,
		warn = icons.warn,
		info = icons.hint,
		hint = icons.info,
	},
	diagnostics_color = {
		color_error = { fg = colors.red },
		color_warn = { fg = colors.yellow },
		color_info = { fg = colors.cyan },
	},
	gui = "bold",
	color = { fg = "none" },
	padding = { right = 2, left = 2 },
})

ins_right({
	"location",
	padding = { right = 0, left = 0 },
	color = {
		fg = colors.purple,
	},
})

ins_right({
	"progress",
	color = {
		fg = colors.cyan,
	},
	gui = "bold",
	padding = { right = 1, left = 1 },
})

ins_right({
	function()
		return icons.left_half_ball
	end,
	color = { fg = colors.rounded_fg, bg = "none" },
	padding = { left = 0, right = 0 },
})

ins_right({
	function()
		local msg = "No Active Lsp"
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	color = { fg = colors.orange, bg = colors.rounded_fg },
	padding = { right = 1, left = 1 },
})

ins_right({
	function()
		return icons.right_half_ball
	end,
	color = { fg = colors.rounded_fg, bg = "none" },
	padding = { right = 1, left = 0 },
})

ins_right({
	function()
		return icons.left_half_ball
	end,
	color = { fg = colors.rounded_fg, bg = "none" },
	padding = { left = 0, right = 0 },
})

ins_right({
	"filetype",
	cond = conditions.buffer_not_empty,
	color = { fg = colors.pink, bg = colors.rounded_fg },
	padding = { left = 0, right = 1 },
})

ins_right({
	function()
		return icons.right_half_ball
	end,
	color = { fg = colors.rounded_fg, bg = "none" },
	padding = { left = 0, right = 0 },
})

-- =============================================
-- ================ Default ====================
-- =============================================
local config_default = {
	options = {
		globalstatus = true,
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = icons.right_half_ball, right = icons.left_half_ball },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = {
			{ "mode" },
		},
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
}
----------------------------------------------

local modes = {
	"mode",
	separator = { left = "", right = "" },
	icon = " ",
	color = function()
		return { bg = mode_color[vim.fn.mode()], fg = colors.bg }
	end,
	padding = { left = 0, right = 0 },
}

local vim_icons = {
	function()
		return " "
	end,
	separator = { left = "", right = "" },
	color = { bg = "#313244", fg = "#80A7EA" },
	padding = { left = 1, right = 0 },
}

local space = {
	function()
		return " "
	end,
	color = { bg = "none" },
}

local filename = {
	"filename",
	file_status = false,
	separator = { left = "", right = "" },
	color = { fg = "#313244", bg = "#80A7EA" },
	padding = { left = 1 },
}

local filetype_icon = {
	"filetype",
	icon_only = true,
	colored = true,
	color = { bg = "#313244" },
	separator = { left = "", right = "" },
}

local fileformat = {
	"fileformat",
	color = { bg = "#b4befe", fg = "#313244" },
	separator = { left = "", right = "" },
}

local encoding = {
	"encoding",
	color = { bg = "#313244", fg = "#80A7EA" },
	separator = { left = "" },
}

local diff = {
	"diff",
	color = { bg = "#313244", fg = "#313244" },
	separator = { left = "", right = "" },
}

local branch = {
	"branch",
	color = { bg = "#a6e3a1", fg = "#313244" },
	-- color = { bg = colors.cyan, fg = colors.bg },
	separator = { left = "", right = "" },
}

local diagnostic = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	color = { bg = "#313244", fg = "#80A7EA" },
	separator = { left = "", right = "" },
	symbols = {
		error = icons.error,
		warn = icons.warn,
		info = icons.hint,
		hint = icons.info,
	},
	diagnostics_color = {
		color_error = { fg = colors.red },
		color_warn = { fg = colors.yellow },
		color_info = { fg = colors.cyan },
	},
	gui = "bold",
	padding = { right = 1, left = 1 },
}

local lsp = {
	separator = { left = "", right = "" },
	color = { bg = colors.orange, fg = colors.bg },
	function()
		local msg = "No Active Lsp"
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	padding = { right = 1, left = 1 },
}

local progress = {
	"progress",
	color = { bg = colors.cyan, fg = colors.bg },
	separator = { left = "", right = "" },
}

local location = {
	"location",
	separator = { left = "", right = "" },
	color = { bg = "#313244", fg = "#80A7EA" },
	padding = { right = 0, left = 0 },
}

local filetype = {
	"filetype",
	icon_only = false,
	colored = false,
	separator = { left = "", right = "" },
	color = { bg = colors.pink, fg = colors.bg },
	padding = { left = 1, right = 1 },
}

local config_bubbles_custom = {
	options = {
		globalstatus = true,
		icons_enabled = true,
		theme = {
			normal = {
				a = { bg = "none" },
				b = { bg = "none" },
				c = { bg = "none" },
				x = { bg = "none" },
				y = { bg = "none" },
				z = { bg = "none" },
			},
		},
		component_separators = "",
		section_separators = "",
		disabled_filetypes = { "packer" },
		ignore_focus = {},
		always_divide_middle = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { modes, space },
		lualine_b = {
			filename,
			diagnostic,
			space,
		},
		lualine_c = {
			branch,
			diff,
			space,
		},
		lualine_x = { location, progress, space },
		lualine_y = { filetype_icon, lsp, space },
		lualine_z = { filetype },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
}

---------------------------------------------------------
---------------------------------------------------------
---------------------------------------------------------
---------------------------------------------------------

lualine.setup(config_bubbles_custom)
