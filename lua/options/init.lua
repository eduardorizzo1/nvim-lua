local cmd = vim.cmd

cmd('syntax enable')
cmd('filetype plugin indent on')
cmd('autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o')
cmd('autocmd FileType * exe "normal zR"')

local options = {
  number = true,
  autoindent = true,
  smartindent = true,
  incsearch = true,
  termguicolors = true,
  mouse = 'a',
  background = 'dark',
  history = 5000,
  clipboard ='unnamedplus',
  encoding = 'utf8',
  tabstop = 2,
  shiftwidth = 2,

  smartcase = true,
  hlsearch = true,
  signcolumn = 'yes',
  swapfile = false,
  undofile = true,
  backup = false,
	writebackup = false,
	splitright = true,
	splitbelow = true,
	showtabline = 2,
  completeopt = { "menuone", "noselect" },
	-- foldmethod = 'indent',
}

for key, value in pairs(options) do
  vim.opt[key] = value
end
