local dap = require("dap")
local icons = require("user.icons")

vim.fn.sign_define("DapBreakpoint", { text = icons.bug, texthl = "DiagnosticSignError", linehl = "", numhl = "" })
--------------------------------
---- Javascript/Typescript -----
--------------------------------
dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = { os.getenv("HOME") .. "/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js" },
}

dap.configurations.javascript = {
	{
		name = "Launch",
		type = "node2",
		request = "launch",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	},
	{
		-- For this to work you need to make sure the node process is started with the `--inspect` flag.
		name = "Attach to process",
		type = "node2",
		request = "attach",
		processId = require("dap.utils").pick_process,
	},
}

dap.adapters.chrome = {
	type = "executable",
	command = "node",
	args = { os.getenv("HOME") .. "/path/to/vscode-chrome-debug/out/src/chromeDebug.js" }, -- TODO adjust
}

dap.configurations.javascriptreact = { -- change this to javascript if needed
	{
		type = "chrome",
		request = "attach",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		port = 9222,
		webRoot = "${workspaceFolder}",
	},
}

dap.configurations.typescriptreact = { -- change to typescript if needed
	{
		type = "chrome",
		request = "attach",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		port = 9222,
		webRoot = "${workspaceFolder}",
	},
}

---------------------------
--------- Python ----------
---------------------------
dap.adapters.python = {
	type = "executable",
	command = "$HOME/.venv/debugpy/bin/python",
	args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
	{
		-- The first three options are required by nvim-dap
		type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
		request = "launch",
		name = "Launch file",

		-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

		program = "${file}", -- This configuration will launch the current file if used.
		pythonPath = function()
			-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
			-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
			-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
			local cwd = vim.fn.getcwd()
			if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
				return cwd .. "/venv/bin/python"
			elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
				return cwd .. "/.venv/bin/python"
			else
				return "/usr/bin/python"
			end
		end,
	},
}

-- local dap_vscodejs = require("dap-vscode-js")

-- dap_vscodejs.setup({
-- 	-- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
-- 	-- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
-- 	-- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
-- 	adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
-- 	-- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
-- 	-- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
-- 	-- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
-- })
--
-- for _, language in ipairs({ "typescript", "javascript" }) do
-- 	require("dap").configurations[language] = {
-- 		{
-- 			{
-- 				type = "pwa-node",
-- 				request = "launch",
-- 				name = "Launch file",
-- 				program = "${file}",
-- 				cwd = "${workspaceFolder}",
-- 			},
-- 			{
-- 				type = "pwa-node",
-- 				request = "attach",
-- 				name = "Attach",
-- 				processId = require("dap.utils").pick_process,
-- 				cwd = "${workspaceFolder}",
-- 			},
-- 		},
-- 	}
-- end
