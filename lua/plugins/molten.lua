return {
	{
		"benlubas/molten-nvim",
		version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
		dependencies = { "3rd/image.nvim" },
		build = ":UpdateRemotePlugins",
		lazy = false,
		init = function()
			-- these are examples, not defaults. Please see the readme
			vim.g.molten_image_provider = "image.nvim"
			vim.g.molten_output_win_max_height = 20
			vim.g.molten_output_show_more = true
			vim.g.molten_auto_open_output = true
			vim.g.molten_virt_text_output = true
			vim.g.molten_virt_lines_off_by_1 = false
			vim.g.python3_host_prog = "/opt/homebrew/bin/python3.11"
		end,
		keys = {
			{ "<leader>ji", ":MoltenInit<CR>", desc = "Init kernel" },
			{ "<leader>je", ":MoltenEvaluateOperator<CR>", desc = "Evaluate operator" },
			{ "<leader>jl", ":MoltenEvaluateLine<CR>", desc = "Evaluate line" },
			{ "<leader>jr", ":MoltenReevaluateCell<CR>", desc = "Re-evaluate cell" },
			{ "<leader>jv", ":<C-u>MoltenEvaluateVisual<CR>", mode = "v", desc = "Evaluate visual" },
		},
	},
	{
		-- see the image.nvim readme for more information about configuring this plugin
		"3rd/image.nvim",
		opts = {
			backend = "kitty", -- whatever backend you would like to use
			max_width = 100,
			max_height = 12,
			max_height_window_percentage = math.huge,
			max_width_window_percentage = math.huge,
			window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
			window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
		},
	},
}
