return {
   "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    enabled = true,
    use_treesitter = true,
    show_first_indent_level = true,
    show_trailing_blankline_indent = false,
	  show_current_context = true,
	  show_current_context_start = false,
    char = "▏",
	  buftype_exclude = { "terminal" },
    filetype_exclude = {
      "help",
      "alpha",
      "dashboard",
      "neo-tree",
      "nvim-tree",
      "Trouble",
      "lazy",
      "mason",
      "notify",
      "toggleterm",
      "lazyterm",
    },
	  char_highlight_list = {
	  	"IndentBlanklineIndent1",
	  },
  }
}