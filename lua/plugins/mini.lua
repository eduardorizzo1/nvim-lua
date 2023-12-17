return {
  {
    "echasnovski/mini.surround",
    version = "*",
    opts = {
      custom_surroundings = nil,
      highlight_duration = 500,
      n_lines = 20,
      search_method = "cover",
      mappings = {
        add = "sa", -- Add surrounding in Normal and Visual modes
        delete = "sd", -- Delete surrounding
        find = "sf", -- Find surrounding (to the right)
        find_left = "sF", -- Find surrounding (to the left)
        highlight = "sh", -- Highlight surrounding
        replace = "sr", -- Replace surrounding
        update_n_lines = "sn", -- Update `n_lines`
      },
    },
  },
  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      symbol = "▎", -- "▏", "│"
      options = { try_as_border = true },
      draw = {
        delay = 100,
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "NvimTree",
          "Trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
  {
    "echasnovski/mini.animate",
    version = "*",
    event = "VeryLazy",
    opts = function()
      local animate = require("mini.animate")
      return {
        cursor = {
          timing = animate.gen_timing.linear({
            duration = 50,
            unit = "total",
          }),
        },
        resize = {
          timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
        },
        scroll = {
          enable = false,
        },
      }
    end,
  },
}
