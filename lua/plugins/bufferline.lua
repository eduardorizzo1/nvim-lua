local status, bufferline = pcall(require, "bufferline")
local colors = require("user.themes.colorscheme")
local groups = require("bufferline.groups")
local icons = require("user.icons")

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
		show_close_icon = true,
		show_buffer_close_icons = true,
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
				-- text = "-----[ Explorer ]-----",
				text_align = "center",
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
			fg = colors.color.comment,
			bg = colors.color.bg_dark,
		},

		-- Selected
		buffer_selected = {
			fg = colors.color.fg,
			-- bg = colors.color.bg_dark,
			bg = "none",
			bold = true,
			italic = true,
		},
		close_button_selected = {
			fg = colors.color.fg,
			-- bg = colors.color.bg_dark,
			bg = "none",
			bold = true,
		},
		modified_selected = {
			-- bg = colors.color.bg_dark,
			bg = "none",
			bold = true,
		},
		duplicate_selected = {
			fg = colors.color.comment,
			-- bg = colors.color.bg_dark,
			bg = "none",
			italic = true,
		},
		indicator_selected = {
			fg = colors.color.bg_dark,
			-- bg = colors.color.bg_dark,
			bg = "none",
		},
		separator_selected = {
			fg = colors.color.bg_dark,
			-- bg = colors.color.bg_dark,
			bg = "none",
		},

		-- Visible
		close_button_visible = {
			fg = colors.color.fg,
			bg = colors.color.bg_dark,
		},
		modified_visible = {
			bg = colors.color.bg_dark,
		},

		buffer_visible = {
			fg = colors.color.fg,
			bg = colors.color.bg_alt,
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

		----------
		modified = {
			bg = colors.color.bg_dark,
		},
		duplicate = {
			fg = colors.color.comment,
			bg = colors.color.bg_dark,
			italic = true,
		},
		separator = {
			bg = colors.color.bg_dark,
			fg = colors.color.bg_dark,
		},

		offset_separator = {
			fg = colors.color.bg_dark,
			bg = colors.color.bg_dark,
		},

		-- tab = {
		-- 	fg = "#ff00ff",
		-- 	bg = "#ffffff",
		-- },
		-- tab_selected = {
		-- 	fg = "#ff00ff",
		-- 	bg = "#ffffff",
		-- },
		-- tab_close = {
		-- 	fg = "#ff00ff",
		-- 	bg = "#ffffff",
		-- },

		-- numbers = {
		--     fg = '<colour-value-here>',
		--     bg = '<colour-value-here>',
		-- },
		-- numbers_visible = {
		--     fg = '<colour-value-here>',
		--     bg = '<colour-value-here>',
		-- },
		-- numbers_selected = {
		--     fg = '<colour-value-here>',
		--     bg = '<colour-value-here>',
		--     bold = true,
		--     italic = true,
		-- },
		-- diagnostic = {
		--     fg = '<colour-value-here>',
		--     bg = '<colour-value-here>',
		-- },
		-- diagnostic_visible = {
		--     fg = '<colour-value-here>',
		--     bg = '<colour-value-here>',
		-- },
		-- diagnostic_selected = {
		--     fg = '<colour-value-here>',
		--     bg = '<colour-value-here>',
		--     bold = true,
		--     italic = true,
		-- },
		-- hint = {
		--     fg = '<colour-value-here>',
		--     sp = '<colour-value-here>',
		--     bg = '<colour-value-here>'
		-- },
		-- hint_visible = {
		--     fg = '<colour-value-here>',
		--     bg = '<colour-value-here>'
		-- },
		-- hint_selected = {
		--     fg = '<colour-value-here>',
		--     bg = '<colour-value-here>',
		--     sp = '<colour-value-here>'
		--     bold = true,
		--     italic = true,
		-- },
		-- hint_diagnostic = {
		--     fg = '<colour-value-here>',
		--     sp = '<colour-value-here>',
		--     bg = '<colour-value-here>'
		-- },
		-- hint_diagnostic_visible = {
		--     fg = '<colour-value-here>',
		--     bg = '<colour-value-here>'
		-- },
		-- hint_diagnostic_selected = {
		--     fg = '<colour-value-here>',
		--     bg = '<colour-value-here>',
		--     sp = '<colour-value-here>'
		--     bold = true,
		--     italic = true,
		-- },
		-- info = {
		--     fg = '<colour-value-here>',
		--     sp = '<colour-value-here>',
		--     bg = '<colour-value-here>'
		-- },
		-- info_visible = {
		--     fg = '<colour-value-here>',
		--     bg = '<colour-value-here>'
		-- },
		-- info_selected = {
		--     fg = '<colour-value-here>',
		--     bg = '<colour-value-here>',
		--     sp = '<colour-value-here>'
		--     bold = true,
		--     italic = true,
		-- },
		-- info_diagnostic = {
		--     fg = '<colour-value-here>',
		--     sp = '<colour-value-here>',
		--     bg = '<colour-value-here>'
		-- },
		-- info_diagnostic_visible = {
		--     fg = '<colour-value-here>',
		--     bg = '<colour-value-here>'
		-- },
		-- info_diagnostic_selected = {
		--     fg = '<colour-value-here>',
		--     bg = '<colour-value-here>',
		--     sp = '<colour-value-here>'
		--     bold = true,
		--     italic = true,
		-- },
		-- warning = {
		--     fg = '<colour-value-here>',
		--     sp = '<colour-value-here>',
		--     bg = '<colour-value-here>'
		-- },
		-- warning_visible = {
		--     fg = '<colour-value-here>',
		--     bg = '<colour-value-here>'
		-- },
		-- warning_selected = {
		--     fg = '<colour-value-here>',
		--     bg = '<colour-value-here>',
		--     sp = '<colour-value-here>'
		--     bold = true,
		--     italic = true,
		-- },
		-- warning_diagnostic = {
		--     fg = '<colour-value-here>',
		--     sp = '<colour-value-here>',
		--     bg = '<colour-value-here>'
		-- },
		-- warning_diagnostic_visible = {
		--     fg = '<colour-value-here>',
		--     bg = '<colour-value-here>'
		-- },
		-- warning_diagnostic_selected = {
		--     fg = '<colour-value-here>',
		--     bg = '<colour-value-here>',
		--     sp = warning_diagnostic_fg
		--     bold = true,
		--     italic = true,
		-- },
		-- error = {
		--     fg = '<colour-value-here>',
		--     bg = '<colour-value-here>',
		--     sp = '<colour-value-here>'
		-- },
		-- error_visible = {
		--     fg = '<colour-value-here>',
		--     bg = '<colour-value-here>'
		-- },
		-- error_selected = {
		--     fg = '<colour-value-here>',
		--     bg = '<colour-value-here>',
		--     sp = '<colour-value-here>'
		--     bold = true,
		--     italic = true,
		-- },
		-- error_diagnostic = {
		--     fg = '<colour-value-here>',
		--     bg = '<colour-value-here>',
		--     sp = '<colour-value-here>'
		-- },
		-- error_diagnostic_visible = {
		--     fg = '<colour-value-here>',
		--     bg = '<colour-value-here>'
		-- },
		-- error_diagnostic_selected = {
		--     fg = '<colour-value-here>',
		--     bg = '<colour-value-here>',
		--     sp = '<colour-value-here>'
		--     bold = true,
		--     italic = true,
		-- },

		-- pick_selected = {
		-- 	fg = colors.color.rounded_fg,
		-- 	bg = colors.color.bg_alt,
		-- 	bold = true,
		-- 	italic = true,
		-- },
		-- pick_visible = {
		-- 	fg = colors.color.fg,
		-- 	bg = colors.color.bg_alt,
		-- 	bold = true,
		-- 	italic = true,
		-- },
		-- pick = {
		-- 	fg = colors.color.rounded_fg,
		-- 	bg = colors.color.bg_alt,
		-- 	bold = true,
		-- 	italic = true,
		-- },
	},
})
