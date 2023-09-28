return {
	"karb94/neoscroll.nvim",
	config = function()
		local t = {}
		t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "150", [['sine']] } }
		t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "150", [['sine']] } }
		t["<C-y>"] = { "scroll", { "-0.20", "false", "50", nil } }
		t["<C-e>"] = { "scroll", { "0.20", "false", "50", nil } }
		t["zt"] = { "zt", { "300" } }
		t["zz"] = { "zz", { "300" } }
		t["zb"] = { "zb", { "300" } }

		require("neoscroll").setup({
			mappings = { "<C-u>", "<C-d>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
			hide_cursor = true,
			stop_eof = true,
			use_local_scrolloff = false,
			respect_scrolloff = false,
			cursor_scrolls_alone = true,
			easing_function = nil,
			pre_hook = nil,
			post_hook = nil,
			config = {
				set_mappings = {},
			},
		})

		require("neoscroll.config").set_mappings(t)
	end,
}
