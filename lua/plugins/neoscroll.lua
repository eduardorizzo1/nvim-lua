return {
	"karb94/neoscroll.nvim",
	config = function()
		neoscroll = require("neoscroll")

		neoscroll.setup({
			easing = "quadratic",
		})

		local keymap = {
			["<C-u>"] = function()
				neoscroll.ctrl_u({ duration = 50, easing = "sine" })
			end,
			["<C-d>"] = function()
				neoscroll.ctrl_d({ duration = 50, easing = "sine" })
			end,
			["<C-y>"] = function()
				neoscroll.scroll(-0.1, { move_cursor = true, duration = 50 })
			end,
			["<C-e>"] = function()
				neoscroll.scroll(0.1, { move_cursor = true, duration = 50 })
			end,
		}
		local modes = { "n", "v", "x" }
		for key, func in pairs(keymap) do
			vim.keymap.set(modes, key, func)
		end
	end,
}
