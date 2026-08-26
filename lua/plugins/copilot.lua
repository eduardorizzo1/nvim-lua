return {
	"zbirenbaum/copilot.lua",
	opts = function()
		Snacks.toggle({
			name = "Copilot Completions",
			get = function()
				return not require("copilot.client").is_disabled()
			end,
			set = function(state)
				if state then
					require("copilot.command").enable()
				else
					require("copilot.command").disable()
				end
			end,
		}):map("<leader>u,")
	end,
}
