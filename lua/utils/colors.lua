local g = vim.g
local M = {}

local dracula = {
  bg = "#282a36",
  current_line = "#44475a",
  fg = "#f8f8f2",
  comment = "#6272a4",
  cyan = "#8be9fd",
  green = "#50fa7b",
  orange = "#ffb86c",
  pink = "#ff79c6",
  purple = "#bd93f9",
  red = "#ff5555",
  yellow = "#f1fa8c",

  bg_alt = "#313244",
  bg_dark = "#1e1f28",
  bg_dark_alt = "#21222c",
  purple_alt = "#564f8b",
  current_line_alt = "#363747",
  rounded_bg = "#1f2335",
  rounded_fg = "#44475a",
  darkblue = "#081633",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  darkpink = "#bb00ff",
  blue = "#51afef",
  search_hl = "#5f5f68",
  blue_term = "#422fa3",
}

local catppuccin = {
  bg = "#1e1e2e",
  current_line = "#2a2b3c",
  fg = "#cdd6f4",
  comment = "#585b70",
  cyan = "#89dceb",
  green = "#a6e3a1",
  orange = "#fab387",
  pink = "#f5c2e7",
  purple = "#cba6f7",
  red = "#f38ba8",
  yellow = "#f9e2af",

  bg_alt = "#212136",
  bg_dark = "#181825",
  purple_alt = "#b4befe",
  rounded_bg = "#1f2335",
  rounded_fg = "#313244",
  darkblue = "#081633",
  violet = "#f2cdcd",
  magenta = "#eba0ac",
  blue = "#89b4fa",
}

local tokyonight = {
  bg = "#24283b",
  current_line = "#292e42",
  fg = "#c0caf5",
  comment = "#505980",
  cyan = "#7dcfff",
  green = "#73daca",
  orange = "#e0af68",
  pink = "#f7768e",
  purple = "#bb9af7",
  red = "#db4b4b",
  yellow = "#9ece6a",

  bg_alt = "#1f2335",
  bg_dark = "#222436",

  purple_alt = "#564f8b",
  rounded_bg = "#1a1b26",
  rounded_fg = "#333952",
  darkblue = "#081633",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  blue = "#51afef",
}

local kanagawa = {
  bg = "#1f1f28",
  current_line = "#363646",
  fg = "#dcd7ba",
  comment = "#727169",
  cyan = "#7fb4ca",
  green = "#97bb6c",
  orange = "#ffa066",
  pink = "#d27e99",
  purple = "#957fb8",
  red = "#e46876",
  yellow = "#e6c384",

  bg_alt = "#2a2a37",
  bg_dark = "#16161d",

  purple_alt = "#564f8b",
  rounded_bg = "#1a1b26",
  rounded_fg = "#363646",
  darkblue = "#081633",
  violet = "#957fb8",
  magenta = "#957fb8",
  blue = "#7e9cd8",
}

local mode_color = function(theme)
  return {
    n = theme.purple,
    i = theme.green,
    v = theme.pink,
    [""] = theme.pink,
    V = theme.pink,
    c = theme.magenta,
    no = theme.red,
    s = theme.orange,
    S = theme.orange,
    [""] = theme.orange,
    ic = theme.yellow,
    R = theme.red,
    Rv = theme.red,
    cv = theme.red,
    ce = theme.red,
    r = theme.cyan,
    rm = theme.cyan,
    ["r?"] = theme.cyan,
    ["!"] = theme.red,
    t = theme.red,
  }
end

if g.colors_name == "catppuccin" then
  M.color = catppuccin
  M.mode_color = mode_color(catppuccin)
elseif g.colors_name == "tokyonight" then
  M.color = tokyonight
  M.mode_color = mode_color(tokyonight)
elseif g.colors_name == "kanagawa" then
  M.color = kanagawa
  M.mode_color = mode_color(kanagawa)
else
  M.color = dracula
  M.mode_color = mode_color(dracula)
end

return M
