local icons = require("utils.icons")
local colors = require("utils.colors").color
local mode_color = require("utils.colors").mode_color
local dracula = true

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand("%:p:h")
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- ======================================================
local color_bg_mode = function()
  return dracula and { bg = mode_color[vim.fn.mode()], fg = colors.bg_dark } or { bg = mode_color[vim.fn.mode()] }
end

local color_fg_mode = function()
  return dracula and { bg = colors.bg_alt, fg = mode_color[vim.fn.mode()] } or {
    fg = mode_color[vim.fn.mode()],
  }
end

--PERF: =========== Mode ==============
local mode = {
  {
    function()
      return " "
    end,
    color = color_bg_mode,
    padding = { left = 1, right = 0 },
  },
  {
    "mode",
    color = color_bg_mode,
    separator = { right = "" },
    padding = { left = 0, right = 1 },
  },
}

--PERF: =========== Server ==============
local server = function()
  local msg = " Lsp"
  local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then
    return msg
  end
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      return " " .. client.name
    end
  end
  return msg
end

--PERF: =========== Branch ==============
local branch = {
  "branch",
  separator = { right = "" },
  color = dracula and color_fg_mode or {},
  padding = { left = 1, right = 1 },
}

--PERF: =========== Noice ==============
local noice = {
  function()
    return "󰥻 " .. require("noice").api.status.command.get()
  end,
  cond = function()
    return package.loaded["noice"] and require("noice").api.status.command.has()
  end,
  color = dracula and { fg = colors.pink } or {},
}

--PERF: ========= Left Arrow ===========
local left_arrow = {
  function()
    return icons.arrows.left
  end,
  color = dracula and { fg = colors.comment } or {},
  padding = { right = 0, left = 0 },
}

--HACK: =================================
--HACK: =========== DEFAULT =============
--HACK: =================================
local default = {
  options = {
    icons_enabled = true,
    theme = dracula and {
      normal = {
        a = { bg = colors.bg },
        b = { bg = colors.bg },
        c = { bg = colors.bg },
        x = { bg = colors.bg },
        y = { bg = colors.bg },
        z = { bg = colors.bg },
      },
    } or "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = mode,
    lualine_b = {
      branch,
    },
    lualine_c = {
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        gui = "bold",
        padding = { right = 0, left = 1 },
      },
      {
        "filetype",
        icon_only = true,
        colored = true,
        separator = { left = "", right = "" },
        padding = { left = 1, right = 0 },
      },
      {
        "filename",
        cond = conditions.buffer_not_empty,
        color = dracula and { fg = colors.fg } or {},
        shorten = true,
        file_status = false,
        padding = { left = 1, right = 1 },
      },
    },
    lualine_x = {
      {
        "diff",
        symbols = {
          added = icons.git_status.added,
          modified = icons.git_status.modified,
          removed = icons.git_status.removed,
        },
      },
      { "searchcount", color = dracula and { fg = colors.yellow } or {} },
    },
    lualine_y = {
      {
        server,
        color = dracula and color_fg_mode or {},
        separator = { left = "" },
        padding = { right = 1, left = 1 },
      },
    },
    lualine_z = {
      {
        "progress",
        color = color_bg_mode,
        padding = { right = 0, left = 1 },
        separator = { left = "" },
      },
      {
        "location",
        color = color_bg_mode,
        padding = { right = 1, left = 0 },
      },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
}

---------------------------------------------------------
---------------------------------------------------------
---------------------------------------------------------
---------------------------------------------------------

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    opts = true,
  },
  opts = default,
  -- opts = require("utils.bubbles"),
}
