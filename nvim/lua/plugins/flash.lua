return {
  'folke/flash.nvim',
  event = "VeryLazy",
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('flash').setup({
      label = {
        rainbow = {
          enabled = true,
        }
      },
      modes = {
        char = {
          enabled = false,
        },
        search = {
          enabled = false,
        }
      }
    })
    vim.keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })
    vim.keymap.set({ "n", "x", "o" }, "<leader>ft", function() require("flash").treesitter() end,
      { desc = "[F]lash [T]reesitter" })
  end
}
