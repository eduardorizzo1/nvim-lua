return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			--:PERF DapUI
			{
				"rcarriga/nvim-dap-ui",
				opts = {
					controls = {
						element = "repl",
						enabled = true,
						icons = {
							disconnect = "",
							pause = "",
							play = "",
							run_last = "",
							step_back = "",
							step_into = "",
							step_out = "",
							step_over = "",
							terminate = "",
						},
					},
					element_mappings = {},
					expand_lines = true,
					floating = {
						border = "single",
						mappings = {
							close = { "q", "<Esc>" },
						},
					},
					force_buffers = true,
					icons = {
						expanded = "▾",
						collapsed = "▸",
						current_frame = "",
					},
					layouts = {
						{
							elements = {
								{
									id = "breakpoints",
									size = 0.1,
								},
								{
									id = "scopes",
									size = 0.6,
								},
								{
									id = "stacks",
									size = 0.2,
								},
								{
									id = "watches",
									size = 0.1,
								},
							},
							position = "right",
							size = 40,
						},
						{
							elements = {
								{
									id = "repl",
									size = 0.3,
								},
								{
									id = "console",
									size = 0.7,
								},
							},
							position = "bottom",
							size = 15,
						},
					},
					mappings = {
						edit = "e",
						expand = { "<CR>", "<2-LeftMouse>" },
						open = "o",
						remove = "d",
						repl = "r",
						toggle = "t",
					},
					render = {
						indent = 1,
						max_value_lines = 100,
					},
				},
				config = function(_, opts)
					local dap = require("dap")
					local dapui = require("dapui")
					local icons = require("utils.icons")

					vim.fn.sign_define(
						"DapBreakpoint",
						{ text = icons.bug, texthl = "DiagnosticSignError", linehl = "", numhl = "" }
					)

					dapui.setup(opts)
					dap.listeners.after.event_initialized["dapui_config"] = function()
						dapui.open({})
					end
					dap.listeners.before.event_terminated["dapui_config"] = function()
						dapui.close({})
					end
					dap.listeners.before.event_exited["dapui_config"] = function()
						dapui.close({})
					end

					dap.adapters.node2 = {
						type = "executable",
						command = "node",
						args = { os.getenv("HOME") .. "/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js" },
					}

					dap.configurations.javascript = {
						{
							name = "Launch (Node)",
							type = "node2",
							request = "launch",
							program = "${file}",
							cwd = vim.fn.getcwd(),
							sourceMaps = true,
							protocol = "inspector",
							console = "integratedTerminal",
						},
						{
							name = "Attach to process",
							type = "node2",
							request = "attach",
							processId = require("dap.utils").pick_process,
						},
						{
							name = "Launch (Chrome)",
							type = "chrome",
							request = "launch",
							program = "${file}",
							cwd = vim.fn.getcwd(),
							sourceMaps = true,
							protocol = "inspector",
							webRoot = "${workspaceFolder}",
							url = "http://localhost:3000",
							sourceMapPathOverrides = {
								["webpack:///*"] = "${webRoot}/*",
								["/*"] = "*",
							},
						},
					}
				end,
			},
			--PERF: Virtual Text
			{
				"theHamsta/nvim-dap-virtual-text",
				opts = {
					enabled = true, -- enable this plugin (the default)
					enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
					highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
					highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
					show_stop_reason = true, -- show stop reason when stopped for exceptions
					commented = false, -- prefix virtual text with comment string
					only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
					all_references = false, -- show virtual text on all all references of the variable (not only definitions)
					--- A callback that determines how a variable is displayed or whether it should be omitted
					--- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
					--- @param buf number
					--- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
					--- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
					--- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
					display_callback = function(variable, _buf, _stackframe, _node)
						return variable.name .. " = " .. variable.value
					end,

					-- experimental features:
					virt_text_pos = "eol", -- position of virtual text, see `:h nvim_buf_set_extmark()`
					all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
					virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
					virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
					-- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
				},
			},
			--PERF: Mason NvimDap
			{
				"jay-babu/mason-nvim-dap.nvim",
				dependencies = "mason.nvim",
				cmd = { "DapInstall", "DapUninstall" },
				opts = {
					automatic_installation = true,
					handlers = {},
					ensure_installed = {},
				},
			},
		},
	},
}
