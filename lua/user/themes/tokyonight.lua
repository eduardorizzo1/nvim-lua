local cmd = vim.cmd
local g = vim.g

g.tokyonight_italic_comments = false
g.tokyonight_transparent = false

cmd([[ colo tokyonight ]])

cmd([[ hi NvimTreeVertSplit guifg=#1f2335 guibg=#1f2335 ]])
