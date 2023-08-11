local cmd = vim.cmd

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
	updatetime = 300,
	completeopt = "menu,menuone,noselect",
	foldlevel = 20,
	foldmethod = "expr",
	foldexpr = "nvim_treesitter#foldexpr()",
	autowrite = true, -- Enable auto write
	conceallevel = 3, -- Hide * markup for bold and italic
	confirm = true, -- Confirm to save changes before exiting modified buffer
	cursorline = true, -- Enable highlighting of the current line
	expandtab = true, -- Use spaces instead of tabs
	formatoptions = "jcroqlnt", -- tcqj
	grepformat = "%f:%l:%c:%m",
	grepprg = "rg --vimgrep",
	ignorecase = true, -- Ignore case
	inccommand = "nosplit", -- preview incremental substitute
	laststatus = 0,
	list = true, -- Show some invisible characters (tabs...
	pumblend = 10, -- Popup blend
	pumheight = 10, -- Maximum number of entries in a popup
	scrolloff = 4, -- Lines of context
	sessionoptions = { "buffers", "curdir", "tabpages", "winsize" },
	shiftround = true, -- Round indent
	showmode = false, -- Dont show mode since we have a statusline
	sidescrolloff = 8, -- Columns of context
	spelllang = { "en" },
	timeoutlen = 300,
	undolevels = 10000,
	wildmode = "longest:full,full", -- Command-line completion mode
	winminwidth = 5, -- Minimum window width
	wrap = false, -- Disable line wrap
}

vim.opt.shortmess:append({ W = true, I = true, c = true })

for key, value in pairs(options) do
	vim.opt[key] = value
end
