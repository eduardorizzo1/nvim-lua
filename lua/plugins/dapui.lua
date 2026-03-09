return {
	"rcarriga/nvim-dap-ui",
	opts = {
		layouts = {
			{
				position = "left",
				size = 40,
				elements = {
					{ id = "scopes", size = 0.5 },
					{ id = "watches", size = 0.25 },
					{ id = "breakpoints", size = 0.25 },
				},
			},
			{
				position = "bottom",
				size = 10,
				elements = {
					{ id = "repl", size = 0.5 },
					{ id = "console", size = 0.5 },
					{ id = "stack", size = 0.5 },
				},
			},
		},
	},
}
