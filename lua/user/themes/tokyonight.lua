local cmd = vim.cmd
local g = vim.g

g.tokyonight_italic_comments = false
g.tokyonight_transparent = false

cmd([[ colo tokyonight ]])

cmd([[ hi NvimTreeVertSplit guifg=#1f2335 guibg=#1f2335 ]])
-- cmd[[ hi CursorLineNR cterm=bold gui=bold ]]
--
-- cmd[[ hi IndentBlanklineChar guifg=#31364f gui=nocombine ]]
-- cmd[[ hi IndentBlanklineContextChar guifg=#737aa2 gui=nocombine ]]

-- g.tokyonight_italic_keywords=false
-- g.tokyonight_style="night"
