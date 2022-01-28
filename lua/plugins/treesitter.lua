local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

local parser_config = require'nvim-treesitter.parsers'.get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }

configs.setup ({
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    disable = {'css'},
		additional_vim_regex_highlighting = true,
  },
	rainbow = {
		enable = true,
		disable = { 'html' },
		extended_mode = true,
		max_file_lines = nil,
		colors = {
			"#ffff00",
			"#00ffff",
			--"#800080",
			"#ffa500",
		},
	},
  indent = {
    enable = true,
  },
 context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
  autopairs = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  playground = {
    enable = true,
  }
})

require('treesitter-context').setup()
