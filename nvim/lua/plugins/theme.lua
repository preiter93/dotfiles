-- local theme = require('utils').theme
Theme = "github_dark" -- tokyonight | onedark | catppuccin | kanagawa | github_dark

return {
  Theme == "onedark" and {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      require('onedark').setup {
        style = 'cool'
      }
      vim.cmd.colorscheme 'onedark'
    end,
  } or {},

  Theme == "tokyonight" and {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
      })
      vim.cmd.colorscheme 'tokyonight'
    end
  } or {},

  Theme == "catppuccin" and {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
      })
      vim.cmd.colorscheme 'catppuccin'
    end
  } or {},

  Theme == "kanagawa" and {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        theme = "wave",
        background = {
          dark = "dragon",
        },
        colors = {
          theme = {
            wave = {
              ui = {
                -- disable number lines background coloring
                bg_gutter = 'none',
              },
            },
          }
        },
      })
      vim.cmd.colorscheme 'kanagawa-wave'
    end
  } or {},

  Theme == "github_dark" and {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false,
    priority = 1000,
    config = function()
      require("github-theme").setup({})
      vim.cmd.colorscheme 'github_dark_default'
    end,
  } or {},
}
