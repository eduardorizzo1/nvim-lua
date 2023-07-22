local status, barbecue = pcall(require, "barbecue")
local icons = require("user.icons")

if not status then
	return
end

barbecue.setup({
	theme = "auto",
	context_follow_icon_color = false,
	show_navic = true,
	attach_navic = true,
	create_autocmd = true,
	include_buftypes = { "" },
	exclude_filetypes = { "toggleterm", "dashboard", "nvimtree" },
	show_dirname = true,
	show_basename = true,
	show_modified = false,

	modified = function(bufnr)
		return vim.bo[bufnr].modified
	end,
	lead_custom_section = function()
		return " "
	end,
	custom_section = function()
		return " "
	end,

	symbols = {
		modified = "●",
		ellipsis = "…",
		separator = icons.arrow_closed,
	},

	kinds = {
		File = "",
		Module = "",
		Namespace = "",
		Package = "",
		Class = "",
		Method = "",
		Property = "",
		Field = "",
		Constructor = "",
		Enum = "",
		Interface = "",
		Function = "",
		Variable = "",
		Constant = "",
		String = "",
		Number = "",
		Boolean = "",
		Array = "",
		Object = "",
		Key = "",
		Null = "",
		EnumMember = "",
		Struct = "",
		Event = "",
		Operator = "",
		TypeParameter = "",
	},
})

require("barbecue.ui").toggle(false)