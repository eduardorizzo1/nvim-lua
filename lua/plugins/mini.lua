return {
	{
		"echasnovski/mini.surround",
		opts = {
			mappings = {
				add = "sa", -- Add surrounding in Normal and Visual modes
				delete = "sd", -- Delete surrounding
				find = "sf", -- Find surrounding (to the right)
				find_left = "sF", -- Find surrounding (to the left)
				highlight = "sh", -- Highlight surrounding
				replace = "sr", -- Replace surrounding
				update_n_lines = "sn", -- Update `n_lines`
			},
		},
	},
	{
		"echasnovski/mini.indentscope",
		opts = {
			symbol = "▎", -- "▏", "│"
			options = { try_as_border = true },
			draw = {
				delay = 100,
			},
		},
	},
	{
		"echasnovski/mini.animate",
		version = "*",
		event = "VeryLazy",
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
	},
	{
		"echasnovski/mini.comment",
		opts = {
			mappings = {
				comment = "<leader>cc",
				comment_line = "<leader>cc",
				comment_visual = "<leader>cc",
				textobject = "<leader>cc",
			},
		},
	},
	{
		"echasnovski/mini.bufremove",
		keys = {
			{
				"<S-x>",
				function()
					local bd = require("mini.bufremove").delete
					if vim.bo.modified then
						local choice =
							vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
						if choice == 1 then -- Yes
							vim.cmd.write()
							bd(0)
						elseif choice == 2 then -- No
							bd(0, true)
						end
					else
						bd(0)
					end
				end,
				desc = "Delete Buffer",
			},
			{
				"<M-x>",
				function()
					local bd = require("mini.bufremove").delete
					if vim.bo.modified then
						local choice =
							vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
						if choice == 1 then -- Yes
							vim.cmd.write()
							bd(0)
						elseif choice == 2 then -- No
							bd(0, true)
						end
					else
						bd(0)
					end
				end,
				desc = "Delete Buffer",
			},
			{
				"<A-x>",
				function()
					local bd = require("mini.bufremove").delete
					if vim.bo.modified then
						local choice =
							vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
						if choice == 1 then -- Yes
							vim.cmd.write()
							bd(0)
						elseif choice == 2 then -- No
							bd(0, true)
						end
					else
						bd(0)
					end
				end,
				desc = "Delete Buffer",
			},
		},
	},
}
