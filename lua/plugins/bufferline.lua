return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			mode = "buffer",
			themable = true,
			numbers = "none",
			max_name_length = 16,
			max_prefix_length = 16,
			tab_size = 16,
			truncate_name = true,
			enforce_regular_tabs = false,
			move_wraps_at_ends = false,
			buffer_close_icon = "",
			modified_icon = "",
			close_icon = " ",
			left_trunc_marker = " ",
			right_trunc_marker = " ",
			always_show_bufferline = true,
			show_close_icon = true,
			show_buffer_close_icons = false,
			diagnostics = "nvim_lsp",
			right_mouse_command = "vertical sbuffer %d",
			close_command = "bdelete! %d",
			show_tab_indicators = false,
			indicator = {
				-- icon = "❯ ",
				-- icon = "▏",
				icon = "",
				style = "icon",
			},
			separator_style = "slant", -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' }
			hover = {
				enabled = true,
				delay = 0,
				reveal = { "close" },
			},
			offsets = {
				{
					filetype = "NvimTree",
					highlight = "Directory",
					padding = 0,
					separator = false,
					text = function()
						return " " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
					end,
					text_align = "left",
				},
			},

			diagnostics_indicator = function(count, level)
				local icon = level:match("error") and " " or " "
				return " " .. icon .. count
			end,

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

		highlights = {},
	},
}
