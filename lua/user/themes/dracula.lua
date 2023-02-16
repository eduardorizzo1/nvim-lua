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

-- cmd[[ hi Normal guibg=#242131 ]]
-- cmd[[ hi EndOfBuffer guifg=#242131 guibg=#242131  ]]
cmd([[ hi SignColumn guibg=NONE ]])
cmd([[ hi LineNr guifg=#564f8b gui=bold ]])

cmd([[ hi CursorLine guibg=#353847 ]])
cmd([[ hi CursorLineNR cterm=bold guifg=#f1fa8c gui=bold ]])

cmd([[ hi NvimTreeFolderName guifg=#f8f8f2 gui=bold]])
cmd([[ hi NvimTreeFolderIcon guifg=#bd93f9 gui=bold]])
cmd([[ hi NvimTreeOpenedFolderName guifg=#bd93f9 gui=bold]])
cmd([[ hi NvimTreeRootFolder guifg=#6272a4 gui=bold]])
-- cmd[[ hi NvimTreeNormal guibg=#1e1c9 ]
-- cmd[[ hi NvimTreeVertSplit guifg=#1e1c29 guibg=#1e1c29 ]]
-- cmd[[ hi NvimTreeFolderIcon guifg=#8094b4 gui=bold]]

cmd([[ hi IndentBlanklineContextStart guifg=#564f8b gui=underline]])
cmd([[ hi IndentBlanklineContextChar guifg=#564f8b gui=none]])
cmd([[ hi IndentBlanklineIndent1 guifg=#282a36 gui=nocombine]])
-- cmd([[ hi IndentBlanklineIndent2 guifg=#44475a gui=nocombine]])
