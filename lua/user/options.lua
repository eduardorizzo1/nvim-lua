local cmd = vim.cmd

-- cmd('syntax enable')
cmd('filetype plugin indent on')
cmd('autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o')
cmd('autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart')
cmd('autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear')

local options = {
  number = true,
	relativenumber = false,
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
  timeoutlen = 400,
  updatetime = 300,
  completeopt = { "menuone", "noselect" },
}

for key, value in pairs(options) do
  vim.opt[key] = value
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
