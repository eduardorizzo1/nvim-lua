require"nvim-treesitter.configs".setup {
  highlight = {
    enable = true,
    disable = {},
		additional_vim_regex_highlighting = true,
  },
  ensure_installed = "maintained",
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
}

local parser_config = require'nvim-treesitter.parsers'.get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }



require'nvim-treesitter.configs'.setup {
	rainbow = {
		colors = {
			"#ffff00",
			"#00ffff",
			"#800080",
			"#ffa500",
		},
	},
  textobjects = {
    select = {
      enable = true,
			extended_mode = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",

        -- Or you can define your own textobjects like this
        ["iF"] = {
          python = "(function_definition) @function",
          cpp = "(function_definition) @function",
          c = "(function_definition) @function",
          java = "(method_declaration) @function",
        },
      },
    },
  },
}

	-- {
  --   "tsx",
  --   "json",
  --   "html",
  --   "scss",
  --   "typescript",
  --   "javascript",
  --   "vim",
  --   "lua",
  --   "css"
  -- },


			 -- "#8be9fd",
			 -- "#f1fa8c",
			 -- "#ffb86c",
			 -- "#bd93f9",
			 -- "#ff79c6",
			 -- "#ff5555",
