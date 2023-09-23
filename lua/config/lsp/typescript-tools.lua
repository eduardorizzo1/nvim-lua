local M = {}

M.opts = {
	on_attach = require("utils.handlers").on_attach,
	settings = {
		tsserver_plugins = {
			"@styled/typescript-styled-plugin",
		},
		separate_diagnostic_server = true,
		publish_diagnostic_on = "insert_leave",
	},
}

return M
