return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod',                     lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    -- Use nerd font
    vim.g.db_ui_use_nerd_fonts = 1
    -- Do not execute on save
    vim.g.db_ui_execute_on_save = 0
    -- -- Disable default mappings
    -- vim.g.db_ui_disable_mappings = 1
    -- vim.g.db_ui_disable_mappings_dbui = 1
    -- vim.g.db_ui_disable_mappings_dbout = 1
    -- vim.g.db_ui_disable_mappings_sql = 1
    -- vim.g.db_ui_disable_mappings_javascript = 1
    -- -- Custom keymaps
    -- vim.api.nvim_create_autocmd('FileType', {
    --   pattern = 'dbui',
    --   callback = function()
    --     local opts = { buffer = true, silent = true, noremap = true }
    --     local map = vim.keymap.set
    --     map('n', '<leader>do', '<Plug>(DBUI_SelectLine)', opts)       -- Open / toggle drawer
    --     map('n', '<leader>dv', '<Plug>(DBUI_SelectLineVsplit)', opts) -- Open vertical split
    --     map('n', '<leader>dd', '<Plug>(DBUI_DeleteLine)', opts)       -- Delete buffer/saved sql
    --     map('n', '<leader>da', '<Plug>(DBUI_AddConnection)', opts)    -- Add connection
    --     map('n', '<leader>dh', '<Plug>(DBUI_ToggleDetails)', opts)    -- Toggle table/column details
    --     map('n', '<leader>dr', '<Plug>(DBUI_Redraw)', opts)           -- Redraw UI
    -- end,
    -- })
  end,
}
