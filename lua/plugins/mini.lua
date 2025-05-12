return {
	"echasnovski/mini.animate",
	opts = function()
		local animate = require("mini.animate")
		return {
			cursor = {
				timing = animate.gen_timing.linear({
					duration = 50,
					unit = "total",
				}),
			},
			resize = {
				timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
			},
			scroll = {
				enable = false,
			},
		}
	end,
}
