return {
	"akinsho/bufferline.nvim",
	opts = {
		options = {
			always_show_bufferline = true,
			show_buffer_close_icons = false,
			separator_style = "slant",
			-- separator_style = { "▎", "▎" },
			indicator = {
				icon = "",
				style = "icon",
			},
		},
	},
	keys = {
		{ "<S-x>", "<leader>bd", desc = "Delete Buffer" },
		{ "<leader><tab>t", "<cmd>tabnew<cr>", desc = "New Tab" },
		{ "<leader><tab><tab>", "<cmd>tabnext<cr>", desc = "Next Tab" },
		{ "<leader><tab>n", "<cmd>tabnext<cr>", desc = "Next Tab" },
		{ "<leader><tab><S-tab>", "<cmd>tabprevious<cr>", desc = "Previous Tab" },
		{ "<leader><tab>p", "<cmd>tabprevious<cr>", desc = "Previous Tab" },
		{ "<leader><tab>x", "<cmd>tabclose<cr>", desc = "Close Tab" },
	},
}
