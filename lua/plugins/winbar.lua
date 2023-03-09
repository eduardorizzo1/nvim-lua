local status, winbar = pcall(require, "winbar")
if not status then
	return
end

winbar.setup({
	enabled = true,

	show_file_path = true,
	show_symbols = true,

	colors = {
		path = "", -- You can customize colors like #c946fd
		file_name = "",
		symbols = "",
	},

	icons = {
		file_icon_default = "",
		seperator = "",
		editor_state = "●",
		lock_icon = "",

		File = " ",
		Module = " ",
		Namespace = " ",
		Package = " ",
		Class = " ",
		Method = " ",
		Property = " ",
		Field = " ",
		Constructor = " ",
		Enum = "練",
		Interface = "練",
		Function = " ",
		Variable = " ",
		Constant = " ",
		String = " ",
		Number = " ",
		Boolean = "◩ ",
		Array = " ",
		Object = " ",
		Key = " ",
		Null = "ﳠ ",
		EnumMember = " ",
		Struct = " ",
		Event = " ",
		Operator = " ",
		TypeParameter = " ",
	},

	exclude_filetype = {
		"help",
		"startify",
		"dashboard",
		"packer",
		"neogitstatus",
		"NvimTree",
		"Trouble",
		"alpha",
		"lir",
		"Outline",
		"spectre_panel",
		"toggleterm",
		"qf",
	},
})

-- vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
