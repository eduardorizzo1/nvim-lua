return {
	"folke/snacks.nvim",
	opts = {
		dashboard = {
			enabled = false,
		},

		indent = {
			indent = {
				char = "▏",
			},
			scope = {
				char = "▎",
			},
			animate = {
				style = "out",
				easing = "linear",
				duration = {
					step = 20,
					total = 5000,
				},
			},
		},
	},
}
