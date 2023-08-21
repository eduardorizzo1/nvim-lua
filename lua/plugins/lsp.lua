return {
  "neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
		{ "hrsh7th/cmp-nvim-lsp" },
  },
  config = function ()
    local lspconfig = require('lspconfig')
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local handlers = require("utils.handlers")

    mason.setup({
	    ui = {
	    	border = "rounded",
	    	icons = {
	    		package_installed = "✓",
	    		package_pending = "➜",
	    		package_uninstalled = "✗",
	    	},
	    },
    })

    local servers = {
      "lua_ls",
	    "tsserver",
	    "jsonls",
	    "angularls",
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
    }

    mason_lspconfig.setup({
      automatic_installation = true,
      ensure_installed = servers
    })

    for _, server in pairs(servers) do
	    lspconfig[server].setup({
	    	on_attach = handlers.on_attach,
				capabilities = handlers.capabilities,
	    	autostart = true,
	    	settings = {
	    		Lua = {
	    			diagnostics = { globals = { "vim" } },
	    		},
	    	},
      })
    end

    local signs = {
    	Error = " ",
    	Warn = " ",
    	Hint = " ",
    	Info = " ",
    }

    for type, icon in pairs(signs) do
	    local hl = "DiagnosticSign" .. type
	    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "none" })
    end

    vim.diagnostic.config({
	    signs = true,
	    update_in_insert = false,
	    underline = true,
	    severity_sort = true,
	    virtual_text = {
				spacing = 4,
				source = "if_many",
				prefix = "●",
	    },
    })
  end
}