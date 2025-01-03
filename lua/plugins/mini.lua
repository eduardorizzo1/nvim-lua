return {
	{
		"echasnovski/mini.indentscope",
		opts = {
			symbol = "▎",
			draw = {
				delay = 100,
			},
		},
	},
	{
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
		},
	},
}
