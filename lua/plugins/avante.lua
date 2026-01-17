return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	version = false,
	opts = {
		provider = "copilot",
		providers = {
			copilot = {
				endpoint = "https://api.githubcopilot.com",
				proxy = nil,
				allow_insecure = false,
				timeout = 10 * 60 * 1000,
				max_completion_tokens = 1000000,
				reasoning_effort = "high",
				-- model = "claude-opus-4",
			},
			claude = {
				endpoint = "https://api.anthropic.com",
				auth_type = "api",
				model = "claude-opus-4-5-20251101",
				timeout = 30000,
				extra_request_body = {
					temperature = 0.2,
					max_tokens = 8192,
				},
			},
		},
	},
	build = "make",
	dependencies = {
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"hrsh7th/nvim-cmp",
		"nvim-tree/nvim-web-devicons",
		"zbirenbaum/copilot.lua",
		{
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					use_absolute_path = true,
				},
			},
		},
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
