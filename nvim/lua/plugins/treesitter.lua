return {
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
      local treesitter = require("nvim-treesitter.configs")
      treesitter.setup({
        modules = {},
        ignore_install = {},
        auto_install = false,
        sync_install = false,
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
          disable = { 'python', 'dart' }
        },
        ensure_installed = {
          "c",
          "cpp",
          "go",
          "lua",
          "python",
          "rust",
          "typescript",
          "vim",
          "dart",
          "svelte",
          "javascript",
          "yaml",
          "vimdoc",
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
      })
    end,
  },
}
