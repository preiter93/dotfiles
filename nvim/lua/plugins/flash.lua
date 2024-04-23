return {
  'folke/flash.nvim',
  event = { "BufReadPre", "BufNewFile" },
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
    vim.keymap.set({ "n", "x", "o" }, "<leader>ft", function() require("flash").treesitter() end,
      { desc = "[F]lash [T]reesitter" })
  end
}
