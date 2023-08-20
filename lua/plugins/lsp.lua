return {
  "neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    { "folke/neodev.nvim", opts = {} },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
		{ "hrsh7th/cmp-nvim-lsp" },
    { "jose-elias-alvarez/null-ls.nvim" },
  },
  config = function ()
    local lspconfig = require('lspconfig')
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local on_attach = require("utils.handlers").on_attach
    local capabilities = require("utils.handlers").capabilities

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
      automatic_installation = false,
      ensure_installed = servers
    })

    for _, server in pairs(servers) do
	    lspconfig[server].setup({
	    	on_attach = on_attach,
				capabilities = capabilities,
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
		    source = true,
	    },
    })
  end
}