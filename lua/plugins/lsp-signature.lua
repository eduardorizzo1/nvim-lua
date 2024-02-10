return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  opts = {
    debug = false,
    log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log",
    verbose = false,
    bind = true,
    doc_lines = 10,
    max_height = 12,
    max_width = 120,
    wrap = false,
    floating_window = true,
    floating_window_above_cur_line = true,
    fix_pos = false,
    hint_enable = false,
    hint_prefix = "🐼 ",
    hint_scheme = "String",
    hi_parameter = "LspSignatureActiveParameter",
    handler_opts = {
      border = "rounded",
    },
    always_trigger = false,
    auto_close_after = nil,
    check_completion_visible = true,
    extra_trigger_chars = {},
    zindex = 200,
    padding = "",
    transparency = nil,
    shadow_blend = 36,
    shadow_guibg = "Black",
    timer_interval = 200,
    toggle_key = "<C-f>",
    select_signature_key = nil,
    move_cursor_key = nil,
    toggle_key_flip_floatwin_setting = true,
    floating_window_off_x = 5,                      -- adjust float windows x position.
    floating_window_off_y = function()              -- adjust float windows y position. e.g. set to -2 can make floating window move up 2 lines
      local linenr = vim.api.nvim_win_get_cursor(0)[1] -- buf line number
      local pumheight = vim.o.pumheight
      local winline = vim.fn.winline()              -- line number in the window
      local winheight = vim.fn.winheight(0)

      -- window top
      if winline - 1 < pumheight then
        return pumheight
      end

      -- window bottom
      if winheight - winline < pumheight then
        return -pumheight
      end
      return 0
    end,
  },
}
