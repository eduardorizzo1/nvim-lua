vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()

  -- Themes
  use 'Mofiqul/dracula.nvim'

  -- Dashboard
  use 'glepnir/dashboard-nvim'
  use 'liuchengxu/vim-clap'

  -- Nvimtree and Lines
  use 'akinsho/bufferline.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'

  -- Neoscroll
  use 'karb94/neoscroll.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind-nvim'
  use 'ray-x/lsp_signature.nvim'
	use 'tami5/lspsaga.nvim'

  -- CMP
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'

  -- Luasnip
  use 'l3mon4d3/luasnip'
  use 'saadparwaiz1/cmp_luasnip'

end)