local status, configs = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

configs.setup({
	ensure_installed = "all",
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
		-- disable = { "html" },
	},
	indent = {
		enable = true,
	},
	autopairs = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
})
