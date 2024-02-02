local opt = vim.opt

opt.relativenumber = false
opt.incsearch = true
opt.mousemev = true
opt.history = 5000
opt.encoding = "utf8"
opt.hlsearch = true
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.showtabline = 2
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.formatoptions = "tcqj" -- jcroqlnt -- tcqj
opt.wrap = true -- break line or side scroll

-- opt.number = true
-- opt.autoindent = true
-- opt.smartindent = true
-- opt.termguicolors = true
-- opt.mouse = "a"
-- opt.background = "dark"
-- opt.clipboard = "unnamedplus"
-- opt.tabstop = 2
-- opt.shiftwidth = 2
-- opt.smartcase = true
-- opt.signcolumn = "yes"
-- opt.undofile = true
-- opt.splitright = true
-- opt.splitbelow = true
-- opt.completeopt = "menu,menuone,noselect"
-- opt.foldlevel = 20
-- opt.shortmess:append({ W = true, I = true, c = true })
-- opt.updatetime = 200

-- for key, value in pairs(options) do
-- 	vim.opt[key] = value
-- end
