return {
	{
		--PERF:======[ Blamer ]=========
		"APZelos/blamer.nvim",
		event = { "BufReadPost", "BufNewFile" },
		init = function()
			vim.g.blamer_enabled = 1
			vim.g.blamer_delay = 0
			vim.g.blamer_show_in_insert_modes = 0
			vim.g.blamer_show_in_visual_modes = 0
			vim.g.blamer_date_format = "%d/%m/%y"
			vim.g.blamer_template = "<committer>, <author-time> • <summary>"
		end,
	},
	{
		--PERF:=====[ NeoGit ]=========
		"NeogitOrg/neogit",
		branch = "master",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "sindrets/diffview.nvim", opts = {} },
			"nvim-telescope/telescope.nvim",
		},
		config = true,
	},
}
