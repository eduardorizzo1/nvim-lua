return {
	"ibhagwan/fzf-lua",
	opts = {
		files = {
			fd_opts = [[--type f --hidden --follow --exclude .git --exclude node_modules]],
		},
	},
	keys = {
		{ "<leader>fg", "<cmd>FzfLua live_grep header=false<cr>", desc = "Live Grep (Root Dir)" },
		{ "<leader>fG", "<cmd>FzfLua git_files header=false<cr>", desc = "Find Files (git-files)" },
		{ "<C-p>", "<cmd>FzfLua files header=false<cr>", desc = "Find Files (Root Dir)" },
		{ "<leader><space>", false },
	},
}
