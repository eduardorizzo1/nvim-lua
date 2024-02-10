return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    {
      "pmizio/typescript-tools.nvim",
      dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
      opts = {
        on_attach = require("utils.handlers").on_attach,
        settings = {
          tsserver_plugins = {
            "@styled/typescript-styled-plugin",
          },
          separate_diagnostic_server = true,
          publish_diagnostic_on = "insert_leave",
        },
      },
    },
    { "hrsh7th/cmp-nvim-lsp" },
  },
  opts = {
    diagnostics = {
      signs = true,
      update_in_insert = false,
      underline = true,
      severity_sort = true,
      virtual_text = {
        spacing = 4,
        source = "if_many",
        -- prefix = "●",
      },
    },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local signs = require("utils.icons").signs

    local servers = {
      "lua_ls",
      -- "tsserver", -- (typescript-tools)
      "jsonls",
      -- "angularls",
      "vuels",
      "html",
      "cssls",
      "cssmodules_ls",
      "tailwindcss",
      "prismals",
      "graphql",
      "marksman",
      "dockerls",
      "dotls",
      "bashls",
      "emmet_ls",
      "solc",
      "tflint",
      "pyright",
      "yamlls",
      "clangd",
      "rust_analyzer",
      "astro",
    }
    require("lspconfig.ui.windows").default_options.border = "rounded"

    vim.diagnostic.config({
      signs = {
        text = {
          signs.Error,
          signs.Warn,
          signs.Info,
          signs.Hint,
        },
      },
      update_in_insert = false,
      underline = true,
      severity_sort = true,
      virtual_text = require("utils.handlers").virtual_text,
    })

    for _, server in pairs(servers) do
      lspconfig[server].setup({
        on_attach = require("utils.handlers").on_attach,
        capabilities = require("utils.handlers").capabilities,
        autostart = true,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      })
    end
  end,
}
