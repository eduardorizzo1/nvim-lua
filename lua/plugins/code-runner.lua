local status, code_runner = pcall(require, "code_runner")

if not status then
	return
end

code_runner.setup({
	filetype = {
		javascript = "node",
		typescript = "ts-node",
		python = "clear & python -u",
	},
})
