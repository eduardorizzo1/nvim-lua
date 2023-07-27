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
})
