return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "K", false }
  end,
  config = function()
    require("lspconfig.ui.windows").default_options.border = "rounded"
  end,
}
