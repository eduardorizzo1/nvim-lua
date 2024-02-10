local M = {}

M.init = function()
  vim.cmd.colorscheme("catppuccin")
  vim.cmd([[ hi SignColumn guibg=NONE ]])
  vim.cmd([[ hi BufferLineSeparator guifg=#101019 guibg=#161623]])
  vim.cmd([[ hi BufferLineFill guibg=#101019]])
end

M.opts = {
  flavour = "macchiato", -- latte, frappe, macchiato, mocha
  background = {        -- :h background
    light = "latte",
    dark = "macchiato",
  },
  transparent_background = false,
  show_end_of_buffer = false, -- show the '~' characters after the end of buffers
  term_colors = false,
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  no_italic = false, -- Force no italic
  no_bold = false,  -- Force no bold
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = { "italic" },
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  color_overrides = {},
  custom_highlights = {},
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    telescope = true,
    notify = false,
    mini = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
  },
}

return M
