local cmd = vim.cmd
local g = vim.g

cmd[[ hi CursorLine guibg=NONE ]]
cmd[[ hi CursorLineNR cterm=bold guifg=#fff gui=bold ]]
cmd[[ hi Normal guibg=NONE ]]
cmd[[ hi EndOfBuffer guifg=NONE ]]
cmd[[ hi CursorLine guibg=NONE ]]
cmd[[ hi SignColumn guibg=NONE ]]

-- Nvimtree
cmd[[ hi NvimTreeNormal guibg=NONE ]]
cmd[[ hi NvimTreeVertSplit guibg=NONE ]]
cmd[[ hi NvimTreeEndOfBuffer guifg=NONE ]]

-- Dracula Theme
g.dracula_show_end_of_buffer = false
g.dracula_transparent_bg = 1
g.dracula_lualine_bg_color = "#000"
g.dracula_italic = 0

