return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      cmdline = {
        enabled = true,
        view = "cmdline_popup",
        opts = {},
      },
      presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = true,            -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true,        -- add a border to hover docs and signature help
      },
      lsp = {
        notify = {
          enabled = false,
        },
        signature = {
          enabled = false,
        },
        progress = {
          enabled = false,
        },
        hover = {
          enabled = false,
          silent = true,
          view = nil,
        },
      },
      health = {
        checker = false,
      },
      messages = {
        enabled = true,            -- enables the Noice messages UI
        view = "notify",           -- default view for messages
        view_error = "notify",     -- view for errors
        view_warn = "notify",      -- view for warnings
        view_history = "messages", -- view for :messages
        view_search = false,       -- false | virtual-text | messages or notify
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
    end,
  },
}
