return {
  'nvim-mini/mini.surround',
  version = '*',
  config = function()
    local MiniSurround = require('mini.surround')
    MiniSurround.setup({
      mappings = {
        add = "gsa",
        delete = "gsd",
        replace = "gsr",
      },
    })
  end
}
