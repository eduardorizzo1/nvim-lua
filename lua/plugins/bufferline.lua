return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			show_tab_indicators = true,
			always_show_bufferline = true,
			show_close_icon = true,
			show_buffer_close_icons = false,
			indicator = {
				icon = "",
				style = "icon",
			},
			separator_style = "slant", -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' }
			offsets = {
				{
					filetype = "NvimTree",
					-- highlight = "Directory",
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
