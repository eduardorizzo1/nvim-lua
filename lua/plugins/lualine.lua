local icons = require("utils.icons")
local colors = require("utils.colors").color
local mode_color = require("utils.colors").mode_color
local noice = {
	function()
		return require("noice").api.status.command.get()
	end,
	cond = function()
		return package.loaded["noice"] and require("noice").api.status.command.has()
	end,
	color = { fg = colors.comment },
}

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
	padding = { right = 0, left = 1 },
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
		section_separators = { left = "", right = "" },
		-- section_separators = { left = icons.right_half_ball, right = icons.left_half_ball },
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
	color = function()
		return { fg = mode_color[vim.fn.mode()], bg = "#313244" }
	end,
	padding = { left = 1, right = 0 },
}

local mode_icons = {
	function()
		return " "
	end,
	separator = { left = "", right = "" },
	color = function()
		return { bg = mode_color[vim.fn.mode()], fg = colors.bg }
	end,
	padding = { left = 0, right = 0 },
}

local space = {
	function()
		return " "
	end,
	color = { bg = "none" },
}

local filename = {
	"filename",
	cond = conditions.buffer_not_empty,
	shorten = true,
	file_status = false,
	separator = { left = "", right = "" },
	color = { bg = colors.bg },
	padding = { left = 1, right = 0 },
}

local diff = {
	"diff",
	color = { bg = "#313244", fg = "#313244" },
	separator = { left = "", right = "" },
}

local branch = {
	"branch",
	color = { fg = "#a6e3a1", bg = "#313244" },
	-- color = { bg = colors.green, fg = colors.bg },
	separator = { left = "", right = "" },
	icon = "",
}

local branch_icons = {
	function()
		return " "
	end,
	color = { bg = "#a6e3a1", fg = "#313244" },
	separator = { left = "", right = "" },
	padding = { left = 0, right = 0 },
}

local diagnostic = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	color = { bg = colors.bg, fg = "#80A7EA" },
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
	color = { bg = colors.pink, fg = colors.bg },
	separator = { left = "", right = "" },
	padding = { right = 1, left = 1 },
}

local progress = {
	"progress",
	color = { bg = colors.cyan, fg = colors.bg },
	separator = { left = "", right = "" },
}

local location = {
	"location",
	separator = { left = "" },
	color = { bg = "#313244", fg = colors.cyan },
	padding = { right = 1, left = 0 },
}

local filetype = {
	"filetype",
	icon_only = false,
	colored = true,
	separator = { left = "" },
	color = { bg = "#313244", fg = colors.pink },
	padding = { left = 1, right = 1 },
	icon = {
		"",
		align = "left",
	},
}

local filetype_icon = {
	"filetype",
	icon_only = true,
	colored = true,
	separator = { left = "", right = "" },
	color = { fg = "#313244", bg = colors.bg },
	padding = { left = 0, right = 0 },
}

local config_bubbles_custom = {
	options = {
		globalstatus = true,
		icons_enabled = true,
		fmt = string.lower,
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
		lualine_a = { mode_icons, modes, space },
		lualine_b = {
			branch_icons,
			branch,
			diff,
			space,
			filetype_icon,
			filename,
			diagnostic,
		},
		lualine_c = {},
		lualine_x = {},
		lualine_y = { location, progress, space },
		lualine_z = { filetype, lsp },
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

local default_dracula = {
	options = {
		icons_enabled = true,
		theme = {
			normal = {
				a = { bg = colors.bg_dark },
				b = { bg = colors.bg_dark },
				c = { bg = colors.bg_dark },
				x = { bg = colors.bg_dark },
				y = { bg = colors.bg_dark },
				z = { bg = colors.bg_dark },
			},
		},
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = {
			{
				function()
					return " "
				end,
				color = function()
					return { bg = mode_color[vim.fn.mode()], fg = colors.bg_dark }
				end,
				padding = { left = 1, right = 0 },
			},
			{
				"mode",
				color = function()
					return { bg = mode_color[vim.fn.mode()], fg = colors.bg_dark }
				end,
				separator = { right = "" },
				padding = { left = 0, right = 1 },
			},
		},
		lualine_b = {
			{
				"branch",
				separator = { right = "" },
				color = function()
					return { bg = colors.bg_alt, fg = mode_color[vim.fn.mode()] }
				end,
				padding = { left = 1, right = 1 },
			},
		},
		lualine_c = {
			{
				"filetype",
				icon_only = true,
				colored = true,
				separator = { left = "", right = "" },
				padding = { left = 1, right = 0 },
			},
			{
				"filename",
				cond = conditions.buffer_not_empty,
				color = { fg = colors.fg },
				shorten = true,
				file_status = false,
				padding = { left = 1, right = 0 },
			},
			"diff",
		},
		lualine_x = {
			{ "searchcount", color = { fg = colors.comment } },
			{
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
				padding = { right = 1, left = 1 },
			},
			noice,
			{
				function()
					return ""
				end,
				color = { fg = colors.comment },
			},
		},
		lualine_y = {
			{
				function()
					local msg = " Lsp"
					local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
					local clients = vim.lsp.get_active_clients()
					if next(clients) == nil then
						return msg
					end
					for _, client in ipairs(clients) do
						local filetypes = client.config.filetypes
						if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
							return " " .. client.name
						end
					end
					return msg
				end,
				color = { fg = colors.purple },
				padding = { right = 0, left = 0 },
			},
			{
				function()
					return ""
				end,
				color = { fg = colors.comment },
			},
			{
				"filetype",
				color = { fg = colors.cyan },
				padding = { right = 1, left = 0 },
			},
		},
		lualine_z = {
			{
				"progress",
				color = function()
					return { bg = colors.bg_alt, fg = mode_color[vim.fn.mode()] }
				end,
				padding = { right = 1, left = 1 },
				separator = { left = "" },
			},
			{
				"location",
				color = function()
					return { bg = mode_color[vim.fn.mode()], fg = colors.bg_dark }
				end,
				separator = { left = "" },
				padding = { right = 1, left = 1 },
			},
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
}

local default = {
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = {
			{
				"mode",
				icon = "",
				separator = { right = "" },
				padding = { left = 1, right = 1 },
			},
		},
		lualine_b = {
			{
				"branch",
				separator = { right = "" },
				padding = { left = 1, right = 1 },
			},
		},
		lualine_c = {
			{
				"filetype",
				icon_only = true,
				colored = true,
				separator = { left = "", right = "" },
				padding = { left = 1, right = 0 },
			},
			{
				"filename",
				cond = conditions.buffer_not_empty,
				shorten = true,
				file_status = false,
				padding = { left = 1, right = 0 },
			},
			"diff",
		},
		lualine_x = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				gui = "bold",
				padding = { right = 1, left = 1 },
			},
			{
				function()
					return ""
				end,
			},
			{
				function()
					local msg = "No Lsp"
					local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
					local clients = vim.lsp.get_active_clients()
					if next(clients) == nil then
						return msg
					end
					for _, client in ipairs(clients) do
						local filetypes = client.config.filetypes
						if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
							return " " .. client.name
						end
					end
					return msg
				end,
				padding = { right = 1, left = 1 },
			},
			{
				function()
					return ""
				end,
			},
			{
				"filetype",
				padding = { right = 1, left = 1 },
			},
		},
		lualine_y = {
			{
				"progress",
			},
		},
		lualine_z = {
			"location",
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
}

---------------------------------------------------------
---------------------------------------------------------
---------------------------------------------------------
---------------------------------------------------------

return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		opts = true,
	},
	opts = default_dracula,
	-- opts = default,
	-- opts = config_bubbles_custom,
}
