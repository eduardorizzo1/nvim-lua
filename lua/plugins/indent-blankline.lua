local status, indent_blankline = pcall(require, "indent_blankline")
if not status then
	return
end

local g = vim.g

vim.opt.termguicolors = true
-- g:indent_blankline_char_list_blankline = ['|', '¦', '┆', '┊']
g.indent_blankline_char = "▏"
g.indentLine_enabled = 1
g.indent_blankline_enabled = true
g.indent_blankline_use_treesitter = true
g.indent_blankline_show_first_indent_level = true
g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_buftype_exclude = { "terminal", "nofile" }

indent_blankline.setup({
	buftype_exclude = { "terminal" },
	filetype_exclude = { "dashboard", "nvimtree", "packer", "help", "html" },
	show_current_context = true,
	show_current_context_start = false,
	context_patterns = {
		"class",
		"return",
		"function",
		"method",
		"^if",
		"^while",
		"jsx_element",
		"^for",
		"^object",
		"^table",
		"block",
		"arguments",
		"if_statement",
		"else_clause",
		"jsx_element",
		"jsx_self_closing_element",
		"try_statement",
		"catch_clause",
		"import_statement",
		"operation_type",
	},
	char_highlight_list = {
		"IndentBlanklineIndent1",
		-- "IndentBlanklineIndent2",
		-- "IndentBlanklineIndent3",
		-- "IndentBlanklineIndent4",
		-- "IndentBlanklineIndent5",
		-- "IndentBlanklineIndent6",
	},
})
