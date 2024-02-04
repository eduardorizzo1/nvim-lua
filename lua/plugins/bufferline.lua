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
		},
	},
}
