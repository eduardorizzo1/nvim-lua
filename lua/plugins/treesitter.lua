local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end
local ft_to_parser = require "nvim-treesitter.parsers".filetype_to_parsername
ft_to_parser.motoko = "typescript"

local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

configs.setup({
	ensure_installed = "all",
	highlight = {
		enable = true,
		disable = { 'css', 'markdown' },
		additional_vim_regex_highlighting = true,
	},
	rainbow = {
		enable = true,
		disable = { 'html' },
		extended_mode = true,
		max_file_lines = nil,
		-- colors = {
		-- 	"#ffa500",
		-- 	"#ff7699",
		-- 	"#00ff00",
		-- 	"#ffff00",
		-- 	"#ff5555",

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
