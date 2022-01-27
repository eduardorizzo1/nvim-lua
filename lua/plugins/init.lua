local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)

  -- Themes
  use 'Mofiqul/dracula.nvim'
	use 'icymind/neosolarized'
	use 'morhetz/gruvbox'
  use 'sainnhe/gruvbox-material'
  --use 'ghifarit53/tokyonight-vim'
  use 'folke/tokyonight.nvim'
	use 'drewtempelmeyer/palenight.vim'
  use 'joshdick/onedark.vim'
	use 'bluz71/vim-moonfly-colors'
	use 'EdenEast/nightfox.nvim'
	use 'patstockwell/vim-monokai-tasty'
  use 'jacoborus/tender.vim'
	use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"
  use "rose-pine/neovim"
  use "rebelot/kanagawa.nvim"
	use 'pineapplegiant/spaceduck'
	use 'cocopon/iceberg.vim'
	use 'altercation/vim-colors-solarized'
	use 'arcticicestudio/nord-vim'
	use 'challenger-deep-theme/vim'

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
  use "romgrk/nvim-treesitter-context"
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'nvim-treesitter/playground'
  use 'windwp/nvim-ts-autotag'
	use "ChristianChiarulli/nvim-ts-rainbow"

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

	-- Toggleterm
	 use "akinsho/toggleterm.nvim"

  -- Luasnip
  use 'l3mon4d3/luasnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'

  -- Colorizers
  use 'norcalli/nvim-colorizer.lua'
  use 'lukas-reineke/indent-blankline.nvim'
	use "windwp/nvim-autopairs"

	-- Twilight and Zen-mode
	use 'folke/zen-mode.nvim'
  use 'folke/twilight.nvim'

  -- Telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use "nvim-telescope/telescope-media-files.nvim"
  use "nvim-telescope/telescope-ui-select.nvim"

	-- Prettier
	use {'prettier/vim-prettier', ['do'] = 'yarn install --frozen-lockfile --production' }

	-- Which key
 	-- use 'folke/which-key.nvim'

	-- Vim multiple cursor
	use {'mg979/vim-visual-multi', branch = 'master'}

	-- Trouble
	use {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  }

	-- Surround
	use "blackCauldron7/surround.nvim"

end)
