local g = vim.g
local cmd = vim.cmd

cmd([[ colo dracula ]])

g.dracula_show_end_of_buffer = false
g.dracula_transparent_bg = false
g.dracula_italic = false
g.dracula_italic_comment = true
g.dracula_show_end_of_buffer = false
g.dracula_transparent_bg = false
g.dracula_italic = false
g.dracula_italic_comment = true
g.dracula_underline = 1
g.dracula_undercurl = 1
g.dracula_show_end_of_buffer = nil

cmd([[ hi SignColumn guibg=NONE ]])
cmd([[ hi LineNr guifg=#564f8b gui=bold ]])

cmd([[ hi CursorLine guibg=#212136 ]])
cmd([[ hi CursorLineNr guifg=#564f8b gui=bold ]])

cmd([[ hi NvimTreeFolderName guifg=#f8f8f2 gui=bold]])
cmd([[ hi NvimTreeFolderIcon guifg=#bd93f9 gui=bold]])
cmd([[ hi NvimTreeOpenedFolderName guifg=#bd93f9 gui=bold]])
cmd([[ hi NvimTreeRootFolder guifg=#6272a4 gui=bold]])

cmd([[ hi IndentBlanklineContextStart guifg=#bd93f9 gui=none]])
cmd([[ hi IndentBlanklineContextChar guifg=#bd93f9 gui=none]])
cmd([[ hi IndentBlanklineIndent1 guifg=#282a36 gui=nocombine]])
