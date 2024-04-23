return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        width = 35,
        relativenumber = true,
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = false,
        },
        special_files = {},
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      -- disable git integration
      git = {
        enable = false,
      },
    })

    -- set keymaps
    vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>",
      { desc = "Toggle file explorer on current file" })
    vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
    vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

    -- disable color highlighting
    local normalHl = vim.api.nvim_get_hl_by_name('Normal', true)
    vim.api.nvim_set_hl(0, 'NvimTreeExecFile', { fg = normalHl.fg })
    vim.api.nvim_set_hl(0, 'NvimTreeImageFile', { fg = normalHl.fg })
    vim.api.nvim_set_hl(0, 'NvimTreeSpecialFile', { fg = normalHl.fg })
    vim.api.nvim_set_hl(0, 'NvimTreeSymlink', { fg = normalHl.fg })
  end
}