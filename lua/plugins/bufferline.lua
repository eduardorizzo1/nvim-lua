local status, bufferline = pcall(require, "bufferline")
local colors = require("user.themes.colorscheme")
local groups = require("bufferline.groups")

if not status then
	return
end

bufferline.setup({
	options = {
		numbers = "none",
		view = "multiwindow",
		buffer_close_icon = "",
		modified_icon = "",
		close_icon = " ",
		left_trunc_marker = " ",
		right_trunc_marker = " ",
		max_name_length = 20,
		max_prefix_length = 15,
		tab_size = 16,
		enforce_regular_tabs = false,
		always_show_bufferline = true,
		show_close_icon = false,
		show_buffer_close_icons = false,
		diagnostic = "nvim_lsp",
		right_mouse_command = "vertical sbuffer %d",
		close_command = "bdelete! %d",
		show_tab_indicators = true,
		indicator = {
			icon = "",
			style = "none",
		},
		separator_style = "slant", -- "slope | slant"
		hover = {
			enabled = true,
			delay = 0,
			reveal = { "close" },
		},
		groups = {
			items = {
				{ name = "group 1", ... },
				groups.builtin.ungrouped, -- the ungrouped buffers will be in the middle of the grouped ones
				{ name = "group 2", ... },
			},
		},

		offsets = {
			{
				filetype = "NvimTree",
				highlight = "Directory",
				padding = 0,
				separator = true,
				text = function()
					return " " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
				end,
				text_align = "left",
			},
		},

		custom_filter = function(buf_number)
			-- Func to filter out our managed/persistent split terms
			local present_type, type = pcall(function()
				return vim.api.nvim_buf_get_var(buf_number, "term_type")
			end)

			if present_type then
				if type == "vert" then
					return false
				elseif type == "hori" then
					return false
				end
				return true
			end

			return true
		end,
	},

	highlights = {
		fill = {
			fg = colors.color.fg,
			bg = colors.color.bg_dark,
		},

		background = {
			fg = colors.color.current_line,
			bg = colors.color.bg_dark,
		},

		buffer_selected = {
			fg = colors.color.fg,
			bg = "none",
			italic = true,
		},

		close_button_selected = {
			fg = colors.color.fg,
			bg = "none",
			bold = true,
		},

		modified_selected = {
			bg = "none",
			bold = true,
		},

		duplicate_selected = {
			fg = colors.color.cyan,
			bg = "none",
			italic = true,
			bold = true,
		},

		indicator_selected = {
			fg = colors.color.bg_dark,
			bg = "none",
		},

		close_button_visible = {
			fg = colors.color.fg,
			bg = colors.color.bg_dark,
		},

		modified_visible = {
			bg = colors.color.bg_dark,
		},

		buffer_visible = {
			fg = colors.color.fg,
			bg = colors.color.bg,
		},

		close_button = {
			fg = colors.color.fg,
			bg = colors.color.bg_dark,
		},

		duplicate_visible = {
			fg = colors.color.fg,
			bg = colors.color.bg_dark,
			italic = true,
		},

		separator_visible = {
			fg = colors.color.bg_dark,
			bg = colors.color.bg_dark,
		},

		separator_selected = {
			fg = colors.color.bg_dark,
			bg = "none",
		},

		separator = {
			bg = colors.color.bg_dark,
			fg = colors.color.bg_dark,
		},

		duplicate = {
			fg = colors.color.current_line,
			bg = colors.color.bg_dark,
			italic = true,
		},

		modified = {
			bg = colors.color.bg_dark,
		},

		offset_separator = {
			fg = colors.color.bg_dark,
			bg = colors.color.bg_dark,
		},
		trunc_marker = {
			fg = colors.color.purple_alt,
			bg = colors.color.bg_dark,
		},
	},
})
