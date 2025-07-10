return {
  'theprimeagen/harpoon',
  config = function()
    vim.keymap.set('n', '<leader>ha', require('harpoon.mark').add_file, { desc = '[H]arpoon [A]dd' })
    vim.keymap.set('n', '<leader>hm', require('harpoon.ui').toggle_quick_menu, { desc = '[H]arpoon [M]enu' })
    vim.keymap.set('n', '<leader>hj', function() require('harpoon.ui').nav_file(1) end, { desc = '[H]arpoon [1]' })
    vim.keymap.set('n', '<leader>hk', function() require('harpoon.ui').nav_file(2) end, { desc = '[H]arpoon [2]' })
    vim.keymap.set('n', '<leader>hl', function() require('harpoon.ui').nav_file(3) end, { desc = '[H]arpoon [3]' })
    vim.keymap.set('n', '<leader>h;', function() require('harpoon.ui').nav_file(4) end, { desc = '[H]arpoon [4]' })
  end
}
