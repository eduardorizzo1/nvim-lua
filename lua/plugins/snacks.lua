return {
	"folke/snacks.nvim",
	opts = {
		indent = {
			enabled = true,
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

		picker = {
			sources = {
				explorer = {
					hidden = true,
					ignored = true,
					actions = {
						toggle_dir = function(picker, item)
							if item.dir == false then
								picker:action("confirm")
								picker:action("close")
							else
								picker:action("confirm")
							end
						end,
					},
					win = {
						list = {
							keys = {
								["<cr>"] = "toggle_dir",
								["<c-p>"] = false,
								["<c-k>"] = false,
								["<c-j>"] = false,
								["<c-b>"] = false,
								["<S-l>"] = false,
								["<leader>fg"] = false,
								["<c-c>"] = false,
								["<BS>"] = "explorer_up",
								["l"] = "confirm",
								["h"] = "explorer_close", -- close directory
								["a"] = "explorer_add",
								["d"] = "explorer_del",
								["r"] = "explorer_rename",
								["c"] = "explorer_copy",
								["m"] = "explorer_move",
								["o"] = "explorer_open", -- open with system application
								["P"] = "toggle_preview",
								["y"] = { "explorer_yank", mode = { "n", "x" } },
								["p"] = "explorer_paste",
								["<S-r>"] = "explorer_update",
								["<leader>/"] = "picker_grep",
								["<c-t>"] = "terminal",
								["."] = "tcd",
								["I"] = "toggle_ignored",
								["H"] = "toggle_hidden",
								["Z"] = "explorer_close_all",
								["]g"] = "explorer_git_next",
								["[g"] = "explorer_git_prev",
								["]d"] = "explorer_diagnostic_next",
								["[d"] = "explorer_diagnostic_prev",
								["]w"] = "explorer_warn_next",
								["[w"] = "explorer_warn_prev",
								["]e"] = "explorer_error_next",
								["[e"] = "explorer_error_prev",
							},
						},
					},
					layout = {
						auto_hide = { "input" },
						layout = {
							width = 30,
						},
					},
				},
			},
		},

		statuscolumn = { enabled = true },
		words = { enabled = true },

		dashboard = {
			enabled = true,
			width = 50,
			preset = {
				header = [[
	           ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗
	           ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║
	           ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║
	           ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║
	           ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║
	           ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝
	          ╭──────────────────────────────╮
	          │⣿⠘⣿⣿⣿⡿⡿⣟⣟⢟⢟⢝⠵⡝⣿⡿⢂⣼⣿⣷⣌⠩⡫⡻⣝⠹⢿⣿⣷ │
	          │⡆⣿⣆⠱⣝⡵⣝⢅⠙⣿⢕⢕⢕⢕⢝⣥⢒⠅⣿⣿⣿⡿⣳⣌⠪⡪⣡⢑⢝⣇│
	          │⡆⣿⣿⣦⠹⣳⣳⣕⢅⠈⢗⢕⢕⢕⢕⢕⢈⢆⠟⠋⠉⠁⠉⠉⠁⠈⠼⢐⢕⢽│
	          │⡗⢰⣶⣶⣦⣝⢝⢕⢕⠅⡆⢕⢕⢕⢕⢕⣴⠏⣠⡶⠛⡉⡉⡛⢶⣦⡀⠐⣕⢕│
	          │⡝⡄⢻⢟⣿⣿⣷⣕⣕⣅⣿⣔⣕⣵⣵⣿⣿⢠⣿⢠⣮⡈⣌⠨⠅⠹⣷⡀⢱⢕│
	          │⡝⡵⠟⠈⢀⣀⣀⡀⠉⢿⣿⣿⣿⣿⣿⣿⣿⣼⣿⢈⡋⠴⢿⡟⣡⡇⣿⡇⡀⢕│
	          │⡝⠁⣠⣾⠟⡉⡉⡉⠻⣦⣻⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣦⣥⣿⡇⡿⣰⢗⢄│
	          │⠁⢰⣿⡏⣴⣌⠈⣌⠡⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣉⣉⣁⣄⢖⢕⢕⢕│
	          │⡀⢻⣿⡇⢙⠁⠴⢿⡟⣡⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣵⣵⣿│
	          │⡻⣄⣻⣿⣌⠘⢿⣷⣥⣿⠇⣿⣿⣿⣿⣿⣿⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿│
	          │⣷⢄⠻⣿⣟⠿⠦⠍⠉⣡⣾⣿⣿⣿⣿⣿⣿⢸⣿⣦⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟│
	          │⡕⡑⣑⣈⣻⢗⢟⢞⢝⣻⣿⣿⣿⣿⣿⣿⣿⠸⣿⠿⠃⣿⣿⣿⣿⣿⣿⡿⠁⣠│
	          │⡝⡵⡈⢟⢕⢕⢕⢕⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⣀⣈⠙│
	          │⡝⡵⡕⡀⠑⠳⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢉⡠⡲⡫⡪⡪⡣│
	          ╰──────────────────────────────╯
        ]],
				keys = {
					{
						icon = " ",
						key = "a",
						desc = "Neovim",
						action = ":cd ~/.config/nvim | :lua Snacks.explorer.open()",
					},
					{
						icon = " ",
						key = "b",
						desc = "Kitty",
						action = ":cd ~/.config/kitty | :lua Snacks.explorer.open()",
					},
					{
						icon = " ",
						key = "c",
						desc = "Dotfiles",
						action = ":cd ~/dotfiles | :lua Snacks.explorer.open()",
					},
					{
						icon = " ",
						key = "h",
						desc = "Hyprland",
						action = ":cd ~/.config/hypr | :lua Snacks.explorer.open()",
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
		},
	},

	keys = {
		{ "<leader><space>", false },
		{ "<leader>fg", "<cmd>lua Snacks.picker.grep()<cr>", desc = "Live Grep" },
		{ "<C-p>", "<cmd>lua Snacks.picker.files()<cr>", desc = "Find Files" },
		{
			"<leader>fG",
			function()
				---@diagnostic disable-next-line: undefined-global
				Snacks.picker.git_files()
			end,
			desc = "Find Files (git-files)",
		},
	},
}
