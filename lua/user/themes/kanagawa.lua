local cmd = vim.cmd

cmd[[ colo kanagawa ]]
cmd[[ hi NvimTreeVertSplit guifg=#16161d ]]
cmd[[ hi VertSplit guibg=#1f1f28]]

require('kanagawa').setup({})
