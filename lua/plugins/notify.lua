return {
	"rcarriga/nvim-notify",
	keys = {
		{
			";n",
			function()
				require("notify").dismiss({ silent = false, pending = true })
			end,
			desc = "Dismiss all Notifications",
		},
	},
	opts = {
		timeout = 2000,
		max_height = function()
			return math.floor(vim.o.lines * 0.5)
		end,
		max_width = function()
			return math.floor(vim.o.columns * 0.5)
		end,
		on_open = function(win)
			vim.api.nvim_win_set_config(win, { zindex = 100 })
		end,
	},
}
