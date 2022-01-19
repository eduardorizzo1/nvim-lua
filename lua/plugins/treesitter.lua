local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

local status_ok, context = pcall(require, "treesitter-context")
if not status_ok then
	return
end

local parser_config = require'nvim-treesitter.parsers'.get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }

configs.setup ({
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    disable = {},
		additional_vim_regex_highlighting = true,
  },
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
		colors = {
			"#ffff00",
			"#00ffff",
			"#800080",
			"#ffa500",
		},
	},
  indent = {
    enable = true,
  }
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


context.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    throttle = true, -- Throttles plugin updates (may improve performance)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        -- For all filetypes
        -- Note that setting an entry here replaces all other patterns for this entry.
        -- By setting the 'default' entry below, you can control which nodes you want to
        -- appear in the context window.
        default = {
            'class',
            'function',
            'method',
            -- 'for', -- These won't appear in the context
            -- 'while',
            -- 'if',
            -- 'switch',
            -- 'case',
        },
        -- Example for a specific filetype.
        -- If a pattern is missing, *open a PR* so everyone can benefit.
        --   rust = {
        --       'impl_item',
        --   },
    },
    exact_patterns = {
        -- Example for a specific filetype with Lua patterns
        -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
        -- exactly match "impl_item" only)
        -- rust = true,
    }
}
