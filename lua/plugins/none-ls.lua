return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local nls = require("null-ls")
    opts.root_dir = opts.root_dir
        or require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")
    opts.sources = vim.list_extend(opts.sources or {}, {
      nls.builtins.formatting.stylua,
      nls.builtins.formatting.shfmt,
      nls.builtins.formatting.prettierd,
      nls.builtins.formatting.jq,
      nls.builtins.formatting.black.with({ extra_args = { "--fast" } }),
      nls.builtins.formatting.rustfmt.with({
        extra_args = function(params)
          local Path = require("plenary.path")
          local cargo_toml = Path:new(params.root .. "/" .. "Cargo.toml")

          if cargo_toml:exists() and cargo_toml:is_file() then
            for _, line in ipairs(cargo_toml:readlines()) do
              local edition = line:match([[^edition%s*=%s*%"(%d+)%"]])
              if edition then
                return { "--edition=" .. edition }
              end
            end
          end
          return { "--edition=2021" }
        end,
      }),
    })
  end,
}