local icons = require("utils.icons")
local colors = require("utils.colors").color
local mode_color = require("utils.colors").mode_color

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

-- ==========================================================
-- ==========================================================
-- ==========================================================

local default_dracula = {
	options = {
		icons_enabled = true,
		theme = {
			normal = {
				a = { bg = colors.bg },
				b = { bg = colors.bg },
				c = { bg = colors.bg },
				x = { bg = colors.bg },
				y = { bg = colors.bg },
				z = { bg = colors.bg },
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
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				diagnostics_color = {
					color_error = { fg = colors.red },
					color_warn = { fg = colors.yellow },
					color_info = { fg = colors.cyan },
				},
				gui = "bold",
				padding = { right = 1, left = 1 },
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
		},
		lualine_x = {
			{
				"diff",
				symbols = {
					added = icons.git_status.added,
					modified = icons.git_status.modified,
					removed = icons.git_status.removed,
				},
			},
		},
		lualine_y = {
			{ "searchcount", color = { fg = colors.yellow } },
			-- {
			-- 	function()
			-- 		return "󰥻 " .. require("noice").api.status.command.get()
			-- 	end,
			-- 	cond = function()
			-- 		return package.loaded["noice"] and require("noice").api.status.command.has()
			-- 	end,
			-- 	color = { fg = colors.cyan },
			-- },
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
							if client.name == "typescript-tools" then
								client.name = "ts-tools"
							end
							return " " .. client.name
						end
					end
					return msg
				end,
				-- color = { bg = colors.bg_alt, fg = colors.purple },
				color = function()
					return { bg = colors.bg_alt, fg = mode_color[vim.fn.mode()] }
				end,
				separator = { left = "" },
				padding = { right = 1, left = 1 },
			},
		},
		lualine_z = {
			{
				"progress",
				color = function()
					return { bg = mode_color[vim.fn.mode()], fg = colors.bg_dark }
				end,
				padding = { right = 0, left = 1 },
				separator = { left = "" },
			},
			{
				"location",
				color = function()
					return { bg = mode_color[vim.fn.mode()], fg = colors.bg_dark }
				end,
				padding = { right = 1, left = 0 },
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
			{ "searchcount", color = { fg = colors.pink } },
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				gui = "bold",
				padding = { right = 1, left = 1 },
			},
			{
				function()
					return require("noice").api.status.command.get()
				end,
				cond = function()
					return package.loaded["noice"] and require("noice").api.status.command.has()
				end,
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
	-- opts = require("utils.bubbles"),
}
