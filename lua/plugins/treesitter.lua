return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"windwp/nvim-ts-autotag",
		"nvim-treesitter/nvim-treesitter-textobjects",
		opts = {},
	},
	cmd = { "TSUpdateSync" },
	keys = {
		{ "<c-space>", desc = "Increment selection" },
		{ "<bs>", desc = "Decrement selection", mode = "x" },
	},
	opts = {
		ensure_installed = {
			"astro",
			"angular",
			"bash",
			"c",
			"c_sharp",
			"css",
			"html",
			"http",
			"javascript",
			"jsdoc",
			"json",
			"lua",
			"luadoc",
			"luap",
			"markdown",
			"markdown_inline",
			"python",
			"prisma",
			"query",
			"regex",
			"rust",
			"sql",
			"scss",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"vue",
			"yaml",
		},
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = true,
		},
		rainbow = {
			enable = true,
			query = "rainbow-parens",
			disable = { "nvimtree" },
		},
		indent = {
			enable = true,
		},
		autopairs = {
			enable = true,
		},
		autotag = {
			enable = true,
			enable_rename = true,
			enable_close = true,
			enable_close_on_slash = false,
		},
		fold = {
			fold_one_line_after = true,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-space>",
				node_incremental = "<C-space>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
					["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
				},
				selection_modes = {
					["@parameter.outer"] = "v", -- charwise
					["@function.outer"] = "V", -- linewise
					["@class.outer"] = "<c-v>", -- blockwise
				},
				include_surrounding_whitespace = false,
			},
		},
	},
	config = function(_, opts)
		if type(opts.ensure_installed) == "table" then
			local added = {}
			opts.ensure_installed = vim.tbl_filter(function(lang)
				if added[lang] then
					return false
				end
				added[lang] = true
				return true
			end, opts.ensure_installed)
		end
		require("nvim-treesitter.configs").setup(opts)
	end,
}
