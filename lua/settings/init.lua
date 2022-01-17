local options = {
  number = true,
  relativenumber = true,
  shiftwidth = 2,
  mouse = 'a',
  history = 5000,
  clipboard ='unnamedplus',
  fileencoding = 'utf-8',
  autoindent = true,
  smartindent = true,
  incsearch = true,
  shiftwidth = 2,
  termguicolors = true,
  background = 'dark',
  cursorline = true,
  signcolumn = 'yes'
}

for key, value in pairs(options) do
  vim.opt[key] = value
end
