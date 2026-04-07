return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		float = {
			border = "rounded",
			padding = 2,
			max_width = 0.8,
			max_height = 0.8,
		},
		view_options = {
			show_hidden = true,
		},
		default_file_explorer = false,
		keymaps = {
			["g?"] = { "actions.show_help", mode = "n" },
			["<CR>"] = "actions.select",
			-- ["l"] = { "actions.select", mode = "n" },
			["<S-p>"] = "actions.preview",
			["<C-c>"] = { "actions.close", mode = "n" },
			["q"] = { "actions.close", mode = "n" },
			["<C-q>"] = { "actions.close", mode = "n" },
			["<S-r>"] = "actions.refresh",
			["-"] = { "actions.parent", mode = "n" },
			-- ["h"] = { "actions.parent", mode = "n" },
			["<backspace>"] = { "actions.parent", mode = "n" },
			["_"] = { "actions.open_cwd", mode = "n" },
			["`"] = { "actions.cd", mode = "n" },
			["."] = { "actions.cd", mode = "n" },
			["g~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
			["gs"] = { "actions.change_sort", mode = "n" },
			["gx"] = "actions.open_external",
			["<S-h>"] = { "actions.toggle_hidden", mode = "n" },
			["g\\"] = { "actions.toggle_trash", mode = "n" },
		},
	},
	dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	lazy = false,
	keys = {
		{ "<leader>e", "<cmd>Oil --float<cr>", desc = "Oil Float" },
		{ "<C-s>", false },
		{ "<C-h>", false },
		{ "<C-t>", false },
		{ "<C-p>", false },
		{ "<C-l>", false },
	},
}
