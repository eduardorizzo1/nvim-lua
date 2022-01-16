vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()

  -- Theme
  use 'Mofiqul/dracula.nvim'

  use 'glepnir/dashboard-nvim'
  use 'liuchengxu/vim-clap'

  use 'akinsho/bufferline.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'

  use 'karb94/neoscroll.nvim'

end)