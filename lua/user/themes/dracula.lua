local g = vim.g
local cmd = vim.cmd

cmd[[ colo dracula ]]

g.dracula_show_end_of_buffer = false
g.dracula_transparent_bg = true
g.dracula_lualine_bg_color = "#000"
g.dracula_italic = false
g.dracula_italic_comment = true
g.terminal_color_background = '#00ffff'

cmd[[ hi Normal guibg=#242131 ]]
cmd[[ hi NvimTreeNormal guibg=#242131 ]]
cmd[[ hi NvimTreeVertSplit guifg=#564f8b guibg=#242132 ]]
cmd[[ hi NvimTreeEndOfBuffer guifg=#242131 ]]
cmd[[ hi CursorLine guibg=#242131 ]]
cmd[[ hi CursorLineNR cterm=bold guifg=#ffffff gui=bold ]]
cmd[[ hi EndOfBuffer guifg=#242131 guibg=#242131  ]]
cmd[[ hi CursorLine guibg=NONE ]]
cmd[[ hi SignColumn guibg=NONE ]]
cmd[[ hi LineNr guifg=#564f8b gui=bold ]]
