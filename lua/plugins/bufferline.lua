local status_ok, bufferline = pcall(require, "bufferline")
local icons = require("user.icons")
local colors = require("user.themes.colorscheme")
local groups = require("bufferline.groups")

if not status_ok then
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
		show_tab_indicators = false,
		offsets = {
			{
				filetype = "NvimTree",
				highlight = "Directory",
				padding = 0,
				separator = true,
				-- text = "File Explorer"
				text_align = "left",
			},
		},
		indicator = {
			icon = " ",
			style = "icon",
		},
		separator_style = {
			icons.right_arrow,
			icons.right_arrow,
		},
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
		-- custom_areas = {
		-- 	right = function()
		-- 		local result = {}
		-- 		local seve = vim.diagnostic.severity
		-- 		local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
		-- 		local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
		-- 		local info = #vim.diagnostic.get(0, { severity = seve.INFO })
		-- 		local hint = #vim.diagnostic.get(0, { severity = seve.HINT })
		--
		-- 		if error ~= 0 then
		-- 			table.insert(result, { text = "  " .. error, fg = colors.color.red })
		-- 		end
		--
		-- 		if warning ~= 0 then
		-- 			table.insert(result, { text = "  " .. warning, fg = colors.color.yellow })
		-- 		end
		--
		-- 		if hint ~= 0 then
		-- 			table.insert(result, { text = "  " .. hint, fg = colors.color.green })
		-- 		end
		--
		-- 		if info ~= 0 then
		-- 			table.insert(result, { text = "  " .. info, fg = colors.color.cyan })
		-- 		end
		-- 		return result
		-- 	end,
		-- },
		--
		-- diagnostics_indicator = function(count, level, diagnostics_dict, context)
		-- 	return "(" .. count .. ")"
		-- end,

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
		separator = {
			fg = "#564f8b",
			bg = "none",
		},

		-- indicator_selected = {
		-- 	fg = colors.color.fg,
		-- 	bg = "none",
		-- 	bold = true,
		-- },

		buffer_selected = {
			fg = colors.color.fg,
			bg = "none",
			bold = true,
			italic = true,
		},

		close_button = {
			fg = colors.color.rounded_fg,
			bg = "none",
		},

		close_button_selected = {
			fg = colors.color.fg,
			bg = "none",
		},

		-- separator_selected = {
		-- 	fg = "#ff0000",
		-- 	bg = "#ffff00",
		-- },
		--
		-- separator_visible = {
		-- 	fg = "#ff00ff",
		-- 	bg = "#fffff0",
		-- },
		--
		-- indicator_visible = {
		-- 	fg = "#ff00ff",
		-- 	bg = "#fffff0",
		-- },
		-- buffer_visible = {
		-- 	fg = "#ff00ff",
		-- 	bg = "#00ff00",
		-- },
		-- tab = {
		-- 	fg = "#ff00ff",
		-- 	bg = "#ff0000",
		-- },
		--
		-- tab_selected = {
		-- 	fg = "#ff00ff",
		-- 	bg = "#ff0000",
		-- },

		-- close_button_visible = {
		-- 	fg = "#ff00ff",
		-- 	bg = "#00ff00",
		-- },

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
		--
		-- tab_close = {
		-- 	fg = colors.color.rounded_fg,
		-- 	bg = "#ff0000",
		-- },
		--
		-- indicator_selected = {
		-- 	fg = "#1e1c29",
		-- 	bg = "#ff00ff",
		-- },
		--

		--

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
