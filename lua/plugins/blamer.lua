return {
  "APZelos/blamer.nvim",
  init = function ()
    vim.g.blamer_enabled = 1
    vim.g.blamer_delay = 0
    vim.g.blamer_show_in_insert_modes = 0
    vim.g.blamer_show_in_visual_modes = 0
    vim.g.blamer_date_format = '%d/%m/%y'
    vim.g.blamer_template = '<committer>, <author-time> • <summary>'
  end
}