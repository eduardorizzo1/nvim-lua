vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()

  -- Theme
  use 'Mofiqul/dracula.nvim'

  -- Dashboard
  use 'glepnir/dashboard-nvim'
  use 'liuchengxu/vim-clap'

end)