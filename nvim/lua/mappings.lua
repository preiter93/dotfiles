-- [[ Basic Keymaps ]]

-- Use CTRL+s to update
vim.keymap.set('n', '<C-s>', ':update<CR>', { silent = true, noremap = true })
vim.keymap.set('i', '<C-s>', '<C-C>:update<CR>', { silent = true, noremap = true })

-- Disable arrow keys
vim.keymap.set('n', '<Left>', '<Nop>', { silent = true })
vim.keymap.set('n', '<Right>', '<Nop>', { silent = true })
vim.keymap.set('n', '<Down>', '<Nop>', { silent = true })
vim.keymap.set('n', '<Up>', '<Nop>', { silent = true })

-- Yank without the cursor moving to the top of the block
vim.keymap.set('v', 'y', 'ygv<Esc>', { silent = true })

-- Disable quit on Q
vim.keymap.set("n", "Q", "<nop>", { silent = true, noremap = true })

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Exit insert mode by pressing jk or kj
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('i', 'kj', '<Esc>', { noremap = true, silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Vertically jump a half page and stay in the middle
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })

-- Search word and stay in the middle
vim.keymap.set("n", "n", "nzzzv", { noremap = true, silent = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, silent = true })

-- Paste over without copying
vim.keymap.set("x", "<leader>p", [["_dP]], { noremap = true, silent = true })

-- Move highlighted text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Use <Tab> and <S-Tab> to indent a selection
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Substitute the word under the cursor
vim.keymap.set("n", "<leader>rw", [[:%s/<C-r><C-w>/<C-r><C-w>/gc<Left><Left><Left>]], { desc = '[R]eplace [W]ord' })

-- Use '<leader>e' to open the file explorer in the current directory
vim.keymap.set("n", "<leader>e", ':E<CR>', { desc = 'Open explorer' })

-- Enter command mode
-- vim.keymap.set({ 'n', 'v' }, ';', ':', { noremap = true })
