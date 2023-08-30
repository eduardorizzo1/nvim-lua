vim.api.nvim_exec("language en_US.UTF-8", true)

local options = {
	number = true,
	relativenumber = false,
	autoindent = true,
	smartindent = true,
	incsearch = true,
	termguicolors = true,
	mouse = "a",
	mousemev = true,
	background = "dark",
	history = 5000,
	clipboard = "unnamedplus",
	encoding = "utf8",
	tabstop = 2,
	shiftwidth = 2,
	smartcase = true,
	hlsearch = true,
	signcolumn = "yes",
	swapfile = false,
	undofile = true,
	backup = false,
	writebackup = false,
	splitright = true,
	splitbelow = true,
	showtabline = 2,
	updatetime = 200,
	completeopt = "menu,menuone,noselect",
	foldlevel = 20,
	foldmethod = "expr",
	foldexpr = "nvim_treesitter#foldexpr()",
	formatoptions = "jcroqlnt", -- tcqj
	wrap = true,
}

vim.opt.shortmess:append({ W = true, I = true, c = true })

for key, value in pairs(options) do
	vim.opt[key] = value
end
