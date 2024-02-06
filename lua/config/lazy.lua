local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

if not vim.g.vscode then
	require("lazy").setup({
		spec = {
			{
				"LazyVim/LazyVim",
				import = "lazyvim.plugins",
				opts = {
					colorscheme = "tokyonight",
				},
			},
			{ import = "lazyvim.plugins.extras.lang.typescript" },
			{ import = "lazyvim.plugins.extras.lang.json" },
			{ import = "lazyvim.plugins.extras.lang.rust" },
			{ import = "lazyvim.plugins.extras.lang.tailwind" },
			{ import = "lazyvim.plugins.extras.lsp.none-ls" },
			{ import = "lazyvim.plugins.extras.test.core" },
			{ import = "lazyvim.plugins.extras.dap.core" },
			{ import = "lazyvim.plugins.extras.editor.leap" },
			{ import = "lazyvim.plugins.extras.util.mini-hipatterns" },
			{ import = "lazyvim.plugins.extras.ui.edgy" },
			{ import = "lazyvim.plugins.extras.vscode" },
			{ import = "plugins" },
		},
		ui = {
			border = "rounded",
		},
		install = { colorscheme = { "tokyonight", "habamax" } },
		checker = { enabled = true },
		performance = {
			rtp = {
				-- disable some rtp plugins
				disabled_plugins = {
					"gzip",
					-- "matchit",
					-- "matchparen",
					-- "netrwPlugin",
					"tarPlugin",
					"tohtml",
					"tutor",
					"zipPlugin",
				},
			},
		},
	})
else
	-- Vscode Config
	require("lazy").setup({
		spec = {
			{
				"LazyVim/LazyVim",
			},
			{ import = "config.vscode" },
		},
		install = { colorscheme = { "tokyonight" } },
		performance = {
			rtp = {
				disabled_plugins = {
					"gzip",
					"tarPlugin",
					"tohtml",
					"tutor",
					"zipPlugin",
				},
			},
		},
	})
end
