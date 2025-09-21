return {
  'nvim-mini/mini.surround',
  version = '*',
  config = function()
    local MiniSurround = require('mini.surround')
    MiniSurround.setup({
      mappings = {
        add = "gs",      -- Add surrounding in Normal and Visual modes
        delete = "gsd",  -- Delete surrounding
        find = "gsf",    -- Find surrounding (to the right)
        replace = "gsr", -- Replace surrounding
      },
    })
  end
}
