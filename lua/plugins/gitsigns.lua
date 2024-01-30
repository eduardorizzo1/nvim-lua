return {
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
      add = { text = "▏" }, -- '▎ ┆ ▏'
      change = { text = "▏" },
      delete = {
        hl = "GitSignsDelete",
        text = "▏",
      },
      topdelete = { text = "▏" },
      changedelete = { text = "▏" },
      untracked = { text = "▏" },
    },
  },
}
