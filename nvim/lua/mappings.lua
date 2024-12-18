-- [[ Basic Keymaps ]]
local utils = require("utils")

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
vim.keymap.set("x", "p", "P", { noremap = true, silent = true })
-- vim.keymap.set("x", "<leader>p", [["_dP]], { noremap = true, silent = true })

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

-- Open todo
vim.keymap.set('n', '<leader>to', ':e ~/tmp/todo<CR>', { desc = "Open todos" })

-- Use '<leader>e' to open the file explorer in the current directory
vim.keymap.set("n", "<leader>e", ':Explore<CR>', { desc = 'Open explorer' })

-- Enter command mode
-- vim.keymap.set({ 'n', 'v' }, ';', ':', { noremap = true })

-- Scroll a partial page
function ScrollPartialUp()
    local height = vim.api.nvim_win_get_height(0)
    local lines_to_scroll = math.max(1, math.floor(height / 8))

    vim.api.nvim_feedkeys(lines_to_scroll .. "k" .. "zz", 'n', true)
end

function ScrollPartialDown()
    local height = vim.api.nvim_win_get_height(0)
    local lines_to_scroll = math.max(1, math.floor(height / 8))

    vim.api.nvim_feedkeys(lines_to_scroll .. "j" .. "zz", 'n', true)
end

vim.cmd("command! ScrollPartialUp lua ScrollPartialUp()")
vim.cmd("command! ScrollPartialDown lua ScrollPartialDown()")
vim.api.nvim_set_keymap('n', '<C-e>', ':ScrollPartialUp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', ':ScrollPartialDown<CR>', { noremap = true, silent = true })

-- Substitute the word under the cursor
vim.keymap.set("n", "<leader>rw", ':%s/<C-r><C-w>//gc<Left><Left><Left>', { desc = '[R]eplace [W]ord' })

-- Substitute the visual selection
vim.keymap.set("v", "<leader>rs", '\"hy:%s/<C-r>h//gc<Left><Left><Left>', { desc = '[R]eplace [S]election' })

-- Substitute words in a selection
vim.api.nvim_set_keymap('v', '<leader>rw', ':lua ReplaceWordInSelection()<CR>',
    { desc = '[R]eplace [W]ord in Selection' })

function ReplaceWordInSelection()
    local word_to_replace = vim.fn.input("Replace: ")
    if word_to_replace == "" then
        return
    end

    local cmd = "'<,'>s/" .. word_to_replace .. "//g"
    local move_left = vim.api.nvim_replace_termcodes("<Left><Left>", true, true, true)
    vim.api.nvim_feedkeys(":" .. cmd .. move_left, "n", false)
end

vim.api.nvim_set_keymap(
    "v",
    "gs",
    ":lua SurroundCSSWithComment()<CR>",
    { noremap = true, silent = true, desc = "Surround css style with comment" }
)

function SurroundCSSWithComment()
    local bufnr = vim.api.nvim_get_current_buf()

    local start_row, _ = unpack(vim.api.nvim_buf_get_mark(bufnr, "<"))
    local end_row, _ = unpack(vim.api.nvim_buf_get_mark(bufnr, ">"))

    start_row = start_row - 1
    end_row = end_row

    for i = start_row, end_row - 1 do
        local line = vim.api.nvim_buf_get_lines(bufnr, i, i + 1, false)[1]
        if line then
            -- Check if the line is already surrounded with /* and */
            if line:match("^%s*/%*.*%*/%s*$") then
                -- Remove the surrounding /* and */
                line = line:gsub("^%s*/%*%s*", ""):gsub("%s*%*/%s*$", "")
            else
                -- Surround line with /* and */
                line = "/* " .. line .. " */"
            end
            vim.api.nvim_buf_set_lines(bufnr, i, i + 1, false, { line })
        end
    end
end
