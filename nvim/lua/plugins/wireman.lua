return {
  "preiter93/wireman.nvim",
  config = function()
    local wireman = require("wireman")
    wireman.setup({
      cmd = "wireman",
      float_opts = { border = "single", width = 0.9, height = 0.8 },
    })

    wireman.map("<leader>wm", "<cmd>lua require('wireman').toggle()<CR>")
  end
}
