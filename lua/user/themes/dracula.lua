local g = vim.g
local cmd = vim.cmd

cmd[[ colo dracula ]]

g.dracula_show_end_of_buffer = false
g.dracula_transparent_bg = false
g.dracula_lualine_bg_color = "#1e1c29"
g.dracula_lualine_fg_color = "#ffffff"
g.dracula_italic = false
g.dracula_italic_comment = true

cmd[[ hi CursorLine guibg=#242131 ]]
cmd[[ hi CursorLineNR cterm=bold guifg=#ffffff gui=bold ]]
cmd[[ hi EndOfBuffer guifg=#242131 guibg=#242131  ]]
cmd[[ hi CursorLine guibg=NONE ]]
cmd[[ hi SignColumn guibg=NONE ]]
cmd[[ hi LineNr guifg=#564f8b gui=bold ]]

cmd[[ hi Normal guibg=#242131 ]]
cmd[[ hi NvimTreeNormal guibg=#1e1c29 ]]
cmd[[ hi NvimTreeVertSplit guifg=#1e1c29 guibg=#1e1c29 ]]
cmd[[ hi NvimTreeEndOfBuffer guifg=#1e1c29 ]]
cmd[[ hi NvimTreeFolderName guifg=#f8f8f2 gui=bold]]
cmd[[ hi NvimTreeOpenedFolderName guifg=#bd93f9 gui=bold]]

