local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	-- Dashboard
	use("glepnir/dashboard-nvim")
	-- Themes
	use("overcache/NeoSolarized")
	use("ishan9299/nvim-solarized-lua")
	use({ "dracula/vim", as = "dracula" })
	use("Mofiqul/vscode.nvim")
	use("navarasu/onedark.nvim")
	use("olimorris/onedarkpro.nvim")
	use("tiagovla/tokyodark.nvim")
	use("folke/tokyonight.nvim")
	use("drewtempelmeyer/palenight.vim")
	use("morhetz/gruvbox")
	use("EdenEast/nightfox.nvim")
	use("rose-pine/neovim")
	use("rebelot/kanagawa.nvim")
	use("pineapplegiant/spaceduck")
	use("lunarvim/darkplus.nvim")
	use("challenger-deep-theme/vim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("shaunsingh/nord.nvim")
	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-ui-select.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-telescope/telescope-media-files.nvim")
	-- Nvimtree, lualine and bufferline
	use("kyazdani42/nvim-tree.lua")
	use("kyazdani42/nvim-web-devicons")
	use("akinsho/bufferline.nvim")
	use("nvim-lualine/lualine.nvim")
	--Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("windwp/nvim-ts-autotag")
	use("p00f/nvim-ts-rainbow")
	-- Lsp
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use("onsails/lspkind-nvim")
	use("ray-x/lsp_signature.nvim")
	use("tami5/lspsaga.nvim")
	use("tamago324/nlsp-settings.nvim")
	use("jose-elias-alvarez/nvim-lsp-ts-utils")
	use("jose-elias-alvarez/null-ls.nvim")
	use("hrsh7th/nvim-cmp") -- cmp
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("l3MON4D3/luasnip")
	use("rafamadriz/friendly-snippets")
	use("saadparwaiz1/cmp_luasnip")
	use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })
	-- Trouble
	use({ "folke/trouble.nvim", cmd = "TroubleToggle" })
	-- Comments
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use({ "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" })
	-- Colorizers
	use("norcalli/nvim-colorizer.lua")
	use("lukas-reineke/indent-blankline.nvim")
	use("windwp/nvim-autopairs")
	use("RRethy/vim-illuminate")
	-- Markdown Preview
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- Debugger (DAP)
	use({ "mfussenegger/nvim-dap" })
	use({ "rcarriga/nvim-dap-ui" })
	use({ "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } })

	-- Others
	use("folke/zen-mode.nvim")
	use("folke/twilight.nvim")
	use("akinsho/toggleterm.nvim")
	use("karb94/neoscroll.nvim")
	use("lewis6991/impatient.nvim")
	use({ "mg979/vim-visual-multi", branch = "master" })
	use({ "CRAG666/code_runner.nvim", requires = "nvim-lua/plenary.nvim" })
	use("fleischie/vim-styled-components")
	use({ "phaazon/hop.nvim", branch = "v1" })
	use("APZelos/blamer.nvim") -- Git blamer
	use({ "echasnovski/mini.nvim", branch = "stable" }) -- Surround
	use("simrat39/symbols-outline.nvim")
	use("folke/which-key.nvim") -- whichkey

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
