return {
  'abecodes/tabout.nvim',
  event = "InsertEnter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp",
  },
  opts = {
    -- options = {
    tabkey = '<C-t>',
    backwards_tabkey = '',
    act_as_tab = false,
    act_as_shift_tab = false,
    default_tab = '',
    default_shift_tab = '',
    completion = false,
    tabouts = {
      { open = "'", close = "'" },
      { open = '"', close = '"' },
      { open = '`', close = '`' },
      { open = '(', close = ')' },
      { open = '[', close = ']' },
      { open = '{', close = '}' }
    },
    ignore_beginning = true,
    exclude = {}
  },
}
