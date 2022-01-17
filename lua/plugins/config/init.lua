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
  
	--Treesitter
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use 'nvim-treesitter/nvim-treesitter-textobjects'

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
	
	-- Null-ls
	use "jose-elias-alvarez/null-ls.nvim"

  -- Luasnip
  use 'l3mon4d3/luasnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'

  -- Colorizers
  use 'norcalli/nvim-colorizer.lua'
  use 'p00f/nvim-ts-rainbow'
  use 'folke/twilight.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
	use "windwp/nvim-autopairs"

  -- Telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

	-- Prettier
	use {'prettier/vim-prettier', ['do'] = 'yarn install --frozen-lockfile --production' }

end)
