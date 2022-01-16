vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()

  use 'Mofiqul/dracula.nvim'
  use 'glepnir/dashboard-nvim'
  use 'liuchengxu/vim-clap'

end)