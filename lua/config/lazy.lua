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

require("config.keymaps")
require("config.options")

if not vim.g.vscode then
	require("lazy").setup({
		spec = {
			{ import = "plugins" },
		},
		ui = {
			border = "rounded",
		},
	})
else
	require("lazy").setup({
		spec = {
			{ import = "config.vscode.plugins" },
		},
		ui = {
			border = "rounded",
		},
	})
end
