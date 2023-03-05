local cmd = vim.cmd
local g = vim.g

g.tokyonight_italic_comments = false
g.tokyonight_transparent = false

cmd([[ colo tokyonight ]])

cmd([[ hi NvimTreeVertSplit guifg=#1f2335 guibg=#1f2335 ]])

cmd([[ hi NvimTreeFolderIcon guifg=#7aa2f7 gui=bold]])
cmd([[ hi NvimTreeOpenedFolderName guifg=#bb9af7 gui=bold]])
cmd([[ hi NvimTreeRootFolder guifg=#6272a4 gui=bold]])
cmd([[ hi NvimTreeOpenedFile guifg=#73daca guibg=NONE gui=bold]])

cmd([[ hi IndentBlanklineContextStart guifg=#BB9AF7 gui=none]])
cmd([[ hi IndentBlanklineContextChar guifg=#BB9AF7 gui=none]])
cmd([[ hi IndentBlanklineIndent1 guifg=#333952 gui=nocombine]])
