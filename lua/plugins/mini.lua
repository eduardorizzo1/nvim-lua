local icons = require("utils.icons")

return {
	{
		"nvim-mini/mini.icons",
		lazy = false,
		opts = {
			extension = {
				["spec.ts"] = { glyph = icons.SpecFile, hl = "MiniIconsCyan" },
				["spec.js"] = { glyph = icons.SpecFile, hl = "MiniIconsCyan" },
				["test.ts"] = { glyph = icons.SpecFile, hl = "MiniIconsCyan" },
				["test.js"] = { glyph = icons.SpecFile, hl = "MiniIconsCyan" },
			},
		},
	},
}
