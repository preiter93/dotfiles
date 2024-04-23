return {
  "kylechui/nvim-surround",
  event = "VeryLazy",
  version = "*",
  config = function()
    require("nvim-surround").setup({
      keymaps = {
        visual = "S",
      },
    })
  end,
}
