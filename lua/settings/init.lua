vim.cmd('filetype plugin indent on')

local options = {
  termguicolors = true,
  number = true,
  relativenumber = false,
  mouse = 'a',
  history = 5000,
  clipboard ='unnamedplus',
  fileencoding = 'utf-8',
  shiftwidth = 2,
  tabstop = 2,
  autoindent = true,
  smartindent = true,
  smartcase = true,
  incsearch = true,
  hlsearch = true,
  background = 'dark',
  cursorline = true,
  signcolumn = 'yes',
  swapfile = false,
  undofile = true,
  backup = false,
  completeopt = { "menuone", "noselect" }
}

for key, value in pairs(options) do
  vim.opt[key] = value
end
