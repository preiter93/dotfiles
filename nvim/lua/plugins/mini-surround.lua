return {
  'nvim-mini/mini.surround',
  version = '*',
  config = function()
    local MiniSurround = require('mini.surround')
    MiniSurround.setup({
      mappings = {
        add = "ys",
        delete = "ds",
        replace = "cs",
      },
    })
  end
}
