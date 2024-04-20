return {
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ":TSUpdate",
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
      local configs = require("nvim-treesitter.configs")
      configs.setup({
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
        auto_install = false,
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true, disable = { 'python', 'dart' } },
        textobjects = {
          select = {
            -- Textobjects currently slows down startup for dart files:
            -- https://github.com/nvim-treesitter/nvim-treesitter/issues/4945
            disable = { 'dart' },
            enable = true,
            lookahead = true,
            keymaps = {
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
            },
          },
          move = {
            -- Textobjects currently slows down startup for dart files:
            -- https://github.com/nvim-treesitter/nvim-treesitter/issues/4945
            disable = { 'dart' },
            enable = true,
            set_jumps = true,
            goto_next_start = {
              [']m'] = '@function.outer',
              [']]'] = '@class.outer',
            },
            goto_next_end = {
              [']M'] = '@function.outer',
              [']['] = '@class.outer',
            },
            goto_previous_start = {
              ['[m'] = '@function.outer',
              ['[['] = '@class.outer',
            },
            goto_previous_end = {
              ['[M'] = '@function.outer',
              ['[]'] = '@class.outer',
            },
          },
        },
      })
    end,
  },
}
