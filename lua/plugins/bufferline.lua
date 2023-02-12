local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

local icons = require("user.icons")

bufferline.setup({
	options = {
		numbers = "none",
		view = "multiwindow",
		buffer_close_icon = "",
		modified_icon = "",
		close_icon = " ",
		left_trunc_marker = " ",
		right_trunc_marker = " ",
		max_name_length = 15,
		max_prefix_length = 15,
		tab_size = 16,
		enforce_regular_tabs = false,
		always_show_bufferline = true,
		show_close_icon = true,
		show_buffer_close_icons = true,
		diagnostic = "nvim_lsp",
		right_mouse_command = "vertical sbuffer %d",
		close_command = "bdelete! %d",
		separator_style = { icons.right_arrow, icons.right_arrow },
		show_tab_indicators = false,
		indicator = {
			icon = "",
			style = "icon",
		},
		hover = {
			enabled = true,
			delay = 0,
			reveal = { "close" },
		},

		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			return "(" .. count .. ")"
		end,

		offsets = {
			{
				filetype = "NvimTree",
				highlight = "Directory",
				padding = 0,
				-- text = "Explorer",
				separator = true,
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
		-- background = {
		-- 	guifg = "#44475a",
		-- 	guibg = "#1e1c29",
		-- },
		--
		-- fill = {
		-- 		guifg = "#44475a",
		-- 		guibg = "#1e1c29",
		-- 	},
		--
		buffer_selected = {
			fg = "#ffffff",
			bold = true,
		},
		--
		-- close_button = {
		-- 	guibg = "#1e1c29"
		-- },
		--
		-- tab_close = {
		-- 	guifg = "#44475a",
		-- 	guibg = "#1e1c29",
		-- },
		--
		-- indicator_selected = {
		-- 	fg = "#1e1c29",
		-- 	bg = "none",
		-- },
		--
		-- close_button_selected = {
		-- 	guifg = "#fff",
		-- 	gui = "bold"
		-- },

		--
		separator = {
			fg = "#6272a4",
			bg = "none",
		},

		separator_selected = {
			fg = "#ffffff",
			bg = "none",
		},

		-- separator_visible = {
		-- 	fg = "#ABB2BF",
		-- 	bg = "#ABB2BF",
		-- },

		--	modified_selected = {
		--  	guifg = "#F1FA8C",
		--    guibg = "#191A21",
		--  },

		--	tab = {
		--		guifg = "#191A21",
		--		guibg = "#191A21",
		--	},

		--	tab_selected = {
		--		guifg = "#191A21",
		--		guibg = "#191A21",
		--	},

		--	modified = {
		--		guifg = "#F1FA8C",
		--		guibg = "#191A21",
		--  },

		-- }
	},
})
