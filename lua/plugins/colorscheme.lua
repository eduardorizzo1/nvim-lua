local dracula = require("config.themes.dracula")
local tokyonight = require("config.themes.tokyonight")
local kanagawa = require("config.themes.kanagawa")
local catppuccin = require("config.themes.catppuccin")

return {
  --TEST:===== Dracula =====
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    opts = dracula.opts,
  },

  --TEST:===== Tokyonight =====
  {
    "folke/tokyonight.nvim",
    lazy = false,
    opts = tokyonight.opts,
  },

  --TEST:===== kanagawa =====
  {
    "rebelot/kanagawa.nvim",
    opts = kanagawa.opts,
  },

  --TEST:===== Catppuccin =====
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    opts = catppuccin.opts,
  },

  --TEST:===== Gruvbox =====
  {
    "ellisonleao/gruvbox.nvim",
    opts = {},
  },

  --TEST:===== Everforest =====
  {
    "sainnhe/everforest",
    opts = {},
  },

  --TEST:===== Neosolarized =====
  {
    "Tsuzat/NeoSolarized.nvim",
    opts = {},
  },

  --TEST:===== Nightfox =====
  {
    "EdenEast/nightfox.nvim",
  },

  --TEST:===== Onedark =====
  {
    "navarasu/onedark.nvim",
    opts = {
      style = "dark", -- dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
    },
  },

  --TEST:===== Material =====
  {
    "marko-cerovac/material.nvim",
    opts = {},
  },

  --TEST:===== Solarized Osaka =====
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "Mofiqul/vscode.nvim",
    opts = {},
  },
}
