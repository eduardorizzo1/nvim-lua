return {
	"karb94/neoscroll.nvim",
	config = function()
		local t = {}
		-- Syntax: t[keys] = {function, {function arguments}}
		-- Use the "sine" easing function
		t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "150", [['sine']] } }
		t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "150", [['sine']] } }
		-- Use the "circular" easing function
		-- t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "500", [['circular']] } }
		-- t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "500", [['circular']] } }
		-- Pass "nil" to disable the easing animation (constant scrolling speed)
		t["<C-y>"] = { "scroll", { "-0.20", "false", "50", nil } }
		t["<C-e>"] = { "scroll", { "0.20", "false", "50", nil } }
		-- When no easing function is provided the default easing function (in this case "quadratic") will be used
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
