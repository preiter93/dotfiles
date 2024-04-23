-- import the global theme variable
require('plugins.theme')

return {
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = Theme,
        component_separators = '|',
        section_separators = '',
      },
    },
  },
}
