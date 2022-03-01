local cmd = vim.cmd

require('kanagawa').setup({})

cmd[[ hi NvimTreeVertSplit guifg=#16161d ]]

vim.cmd('colo kanagawa')
