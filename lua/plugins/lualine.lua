local lualine = require("lualine")

local colors = {
	bg = "#24283b",
	rounded_bg = "#1f2335",
	rounded_fg = "#333952",
	fg = "#bbc2cf",
	yellow = "#ECBE7B",
	cyan = "#008080",
	darkblue = "#081633",
	green = "#98be65",
	orange = "#FF8800",
	violet = "#a9a1e1",
	magenta = "#c678dd",
	blue = "#51afef",
	red = "#ec5f67",
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

local config = {
	options = {
		component_separators = "",
		section_separators = "",
		theme = {
			normal = { c = { fg = colors.fg, bg = colors.bg } },
			inactive = { c = { fg = colors.fg, bg = colors.bg } },
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
	table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

--------------------------- LEFT ----------------------------------
ins_left({
	function()
		return ""
	end,
	color = { fg = colors.rounded_fg, bg = colors.bg },
	padding = { left = 0, right = 0 },
})
ins_left({
	function()
		return ""
	end,
	color = function()
		local mode_color = {
			n = colors.blue,
			i = colors.green,
			v = colors.violet,
			[""] = colors.violet,
			V = colors.violet,
			c = colors.magenta,
			no = colors.red,
			s = colors.orange,
			S = colors.orange,
			[""] = colors.orange,
			ic = colors.yellow,
			R = colors.red,
			Rv = colors.red,
			cv = colors.red,
			ce = colors.red,
			r = colors.cyan,
			rm = colors.cyan,
			["r?"] = colors.cyan,
			["!"] = colors.red,
			t = colors.red,
		}
		return { fg = mode_color[vim.fn.mode()], bg = colors.rounded_fg }
	end,
	padding = { right = 1, left = 0 },
})
ins_left({
	function()
		return ""
	end,
	color = { fg = colors.rounded_fg, bg = colors.bg },
	padding = { left = 0, right = 1 },
})

----------------
ins_left({
	function()
		return ""
	end,
	color = { fg = colors.rounded_fg, bg = colors.bg },
	padding = { left = 0, right = 0 },
})

ins_left({
	"branch",
	icon = "",
	color = { fg = colors.violet, gui = "bold", bg = colors.rounded_fg },
})

ins_left({
	function()
		return ""
	end,
	color = { fg = colors.rounded_fg, bg = colors.bg },
	padding = { left = 0, right = 1 },
})

----------------
ins_left({
	function()
		return ""
	end,
	color = { fg = colors.rounded_fg, bg = colors.bg },
	padding = { left = 0, right = 0 },
})

ins_left({
	"filename",
	cond = conditions.buffer_not_empty,
	color = { fg = colors.magenta, gui = "bold", bg = colors.rounded_fg },
})

ins_left({
	function()
		return ""
	end,
	color = { fg = colors.rounded_fg, bg = colors.bg },
	padding = { right = 0 },
})

ins_left({
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = { error = " ", warn = " ", info = " " },
	diagnostics_color = {
		color_error = { fg = colors.red },
		color_warn = { fg = colors.yellow },
		color_info = { fg = colors.cyan },
	},
	color = { fg = colors.bg },
})

---------------------------RIGHT----------------------------------
ins_right({ "location", color = { fg = colors.violet, gui = "bold" } })

ins_right({
	function()
		return ""
	end,
	color = { fg = colors.rounded_fg, bg = colors.bg },
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
	-- icon = " LSP:",
	color = { fg = colors.violet, gui = "bold", bg = colors.rounded_fg },
})

ins_right({
	function()
		return ""
	end,
	color = { fg = colors.rounded_fg, bg = colors.bg },
	padding = { right = 1 },
})

ins_right({
	function()
		return ""
	end,
	color = { fg = colors.rounded_fg, bg = colors.bg },
	padding = { left = 0, right = 0 },
})

ins_right({
	"filetype",
	cond = conditions.buffer_not_empty,
	color = { fg = colors.violet, gui = "bold", bg = colors.rounded_fg },
})

ins_right({
	function()
		return ""
	end,
	color = { fg = colors.rounded_fg, bg = colors.bg },
	padding = { left = 0, right = 0 },
})

lualine.setup(config)
