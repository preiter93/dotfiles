-- local theme = require('utils').theme
Theme = "tokyonight" -- tokyonight | onedark | catppuccin

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
}
