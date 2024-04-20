return {
  'folke/flash.nvim',
  config = function()
    -- Setup
    require('flash').setup({
      modes = {
        char = {
          enabled = false,
        }
      }
    })
    -- Keymappings
    vim.keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })
    vim.keymap.set({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter" })
  end
}
