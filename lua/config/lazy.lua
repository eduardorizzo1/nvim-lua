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
---@diagnostic disable-next-line: undefined-field
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
			{ import = "lazyvim.plugins.extras.lang.python" },
			{ import = "lazyvim.plugins.extras.lang.tailwind" },
			{ import = "lazyvim.plugins.extras.lang.markdown" },
			{ import = "lazyvim.plugins.extras.lang.docker" },
			{ import = "lazyvim.plugins.extras.lang.yaml" },
			{ import = "lazyvim.plugins.extras.lang.omnisharp" },
			{ import = "lazyvim.plugins.extras.lang.sql" },
			{ import = "lazyvim.plugins.extras.lang.git" },
			{ import = "lazyvim.plugins.extras.lsp.none-ls" },
			{ import = "lazyvim.plugins.extras.linting.eslint" },
			{ import = "lazyvim.plugins.extras.test.core" },
			{ import = "lazyvim.plugins.extras.dap.core" },
			{ import = "lazyvim.plugins.extras.editor.outline" },
			{ import = "lazyvim.plugins.extras.editor.leap" },
			{ import = "lazyvim.plugins.extras.editor.harpoon2" },
			{ import = "lazyvim.plugins.extras.editor.overseer" },
			{ import = "lazyvim.plugins.extras.coding.yanky" },
			{ import = "lazyvim.plugins.extras.ai.codeium" },
			{ import = "lazyvim.plugins.extras.util.dot" },
			{ import = "lazyvim.plugins.extras.util.rest" },
			{ import = "lazyvim.plugins.extras.util.mini-hipatterns" },
			{ import = "lazyvim.plugins.extras.util.octo" },
			{ import = "lazyvim.plugins.extras.ui.mini-indentscope" },
			{ import = "plugins" },
		},
		ui = {
			border = "rounded",
		},
		install = { colorscheme = { "tokyonight", "habamax" } },
		checker = { enabled = false },
		performance = {
			rtp = {
				-- disable some rtp plugins
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
else
	-- Vscode Config
	require("lazy").setup({
		spec = {
			{
				"LazyVim/LazyVim",
			},
			{ import = "lazyvim.plugins.extras.editor.leap" },
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
