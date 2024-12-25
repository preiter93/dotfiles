return {
  "kylechui/nvim-surround",
  event = "VeryLazy",
  version = "*",
  config = function()
    require("nvim-surround").setup({
      keymaps = {
        normal = "ys",
        visual = "S",
        delete = "ds",
        change = "cs",
      },
    })
  end,
}
