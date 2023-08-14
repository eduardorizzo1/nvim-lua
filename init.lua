local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("user.options")
require("user.keymaps")
require("lazy").setup("plugins")

-- require("user.themes.tokyonight")
-- require("lazy")
-- require("plugins")
-- require("plugins.dashboard")
-- require("plugins.lsp")
-- require("plugins.cmp")
-- require("plugins.nvim-tree")
-- require("plugins.bufferline")
-- require("plugins.lualine")
-- require("plugins.treesitter")
-- require("plugins.rainbow-delimiters")
-- require("plugins.hlargs")
-- require("plugins.neoscroll")
-- require("plugins.colorizer")
-- require("plugins.illuminate")
-- require("plugins.indent-blankline")
-- require("plugins.autopairs")
-- require("plugins.visual-multi")
-- require("plugins.zen-mode")
-- require("plugins.toggleterm")
-- require("plugins.telescope")
-- require("plugins.blamer")
-- require("plugins.gitsigns")
-- require("plugins.hop")
-- require("plugins.code-runner")
-- require("plugins.trouble")
-- require("plugins.mini-surround")
-- require("plugins.comment")
-- require("plugins.todo-comments")
-- require("plugins.nvim-dap")
-- require("plugins.scrollbar")
-- require("plugins.pretty-fold")
-- require("plugins.whichkey")
-- require("plugins.spectre")
