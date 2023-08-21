return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason.nvim" },
  opts = function()
    local nls = require("null-ls")
    local code_actions = nls.builtins.code_actions
    local formatting = nls.builtins.formatting

    return {
      sources = {
		    code_actions.eslint_d,
		    formatting.prettierd,
		    formatting.stylua,
		    formatting.jq,
	    },
    }

  end,
}