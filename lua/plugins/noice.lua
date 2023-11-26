return {
	"folke/noice.nvim",
	event = "VeryLazy",
	enabled = true,
	opts = {
		-- add any options here
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = false,
			inc_rename = true,
			lsp_doc_border = true,
		},
		cmdline = {
			enabled = true,
			view = "cmdline_popup",
			opts = {},
			---@type table<string, CmdlineFormat>
			format = {
				cmdline = { pattern = "^:", icon = "", lang = "vim" },
				search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
				search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
				filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
				lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
				help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
				input = {}, -- Used by input()
				-- lua = false, -- to disable a format, set to `false`
			},
		},
		lsp = {
			notify = {
				enabled = false,
			},
			signature = {
				enabled = false,
			},
			progress = {
				enabled = false,
			},
			hover = {
				enabled = false,
			},
		},
		health = {
			checker = false,
		},
		smart_move = {
			enabled = false,
			excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" },
		},
		messages = {
			-- NOTE: If you enable messages, then the cmdline is enabled automatically.
			-- This is a current Neovim limitation.
			enabled = true,         -- enables the Noice messages UI
			view = "notify",        -- default view for messages
			view_error = "notify",  -- view for errors
			view_warn = "notify",   -- view for warnings
			view_history = "messages", -- view for :messages
			view_search = "notify",
			-- view_search = "virtualtext",
			-- view_search = false,
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		-- "rcarriga/nvim-notify",
	},
}
