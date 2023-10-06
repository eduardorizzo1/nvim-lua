return {
	-- TODO: =================
	-- TODO: ====== Hop ======
	-- TODO: =================
	{
		"smoka7/hop.nvim",
		enabled = true,
		version = "*",
		opts = {
			jump_on_sole_occurrence = false,
		},
	},
	-- TODO: ==================
	-- TODO: ====== Leap ======
	-- TODO: ==================
	{
		"ggandor/leap.nvim",
		dependencies = {
			{ "tpope/vim-repeat", event = "VeryLazy" },
			{
				"ggandor/flit.nvim",
				enabled = true,
				keys = function()
					---@type LazyKeys[]
					local ret = {}
					for _, key in ipairs({ "f", "F", "t", "T" }) do
						ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
					end
					return ret
				end,
				opts = { labeled_modes = "nx" },
			},
		},
		enabled = true,
		keys = {
			{ "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
			{ "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
			{ "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
		},
		config = function(_, opts)
			local leap = require("leap")
			for k, v in pairs(opts) do
				leap.opts[k] = v
			end
			leap.add_default_mappings(true)
			vim.keymap.del({ "x", "o" }, "x")
			vim.keymap.del({ "x", "o" }, "X")
		end,
	},
	-- TODO: =========================
	-- TODO: ====== Pretty Fold ======
	-- TODO: =========================
	{
		"anuvyklack/pretty-fold.nvim",
		opts = {
			config = {
				sections = {
					left = {
						"content",
					},
					right = {
						" ",
						"number_of_folded_lines",
						": ",
						"percentage",
						" ",
						function(config)
							return config.fill_char:rep(3)
						end,
					},
				},
				fill_char = "•",

				remove_fold_markers = true,
				keep_indentation = true,
				process_comment_signs = "spaces",
				comment_signs = {},
				stop_words = {
					"@brief%s*", -- (for C++) Remove '@brief' and all spaces after.
				},

				add_close_pattern = true, -- true, 'last_line' or false

				matchup_patterns = {
					{ "{", "}" },
					{ "%(", ")" }, -- % to escape lua pattern char
					{ "%[", "]" }, -- % to escape lua pattern char
				},

				ft_ignore = { "neorg" },
			},
		},
	},
	-- TODO: =======================
	-- TODO: ====== Neoscroll ======
	-- TODO: =======================
	{
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
	},
}
