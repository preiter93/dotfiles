return {

    'nvim-telescope/telescope.nvim',
    -- see https://github.com/nvim-telescope/telescope.nvim/issues/3469
    commit = 'b4da76be54691e854d3e0e02c36b0245f945c2c7',
    version = '*',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        -- Setup telescope
        local telescope = require("telescope")
        telescope.setup({
            defaults = {
                path_display = { "truncate" },
                mappings = {
                    i = {
                        ['<C-u>'] = false,
                        ['<C-d>'] = false
                    },
                },
                layout_strategy = 'vertical',
                layout_config = {
                    vertical = {
                        width = 0.90,
                    },
                },
            },
        })

        -- Map `<leader>?` to show recently opened files
        vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles,
            { desc = '[?] Find recently opened files' })

        -- Map `<leader><space>` to open Telescope's `buffers` picker
        vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers,
            { desc = '[ ] Find existing buffers' })

        -- Map `<leader>sf` to open Telescope's `find_files` picker
        vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files,
            { desc = '[S]earch [F]iles' })

        -- Map `<leader>sh` to open Telescope's `help_tags` picker
        vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags,
            { desc = '[S]earch [H]elp' })

        -- Map `<leader>sw` to open Telescope's `grep_string` picker
        vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string,
            { desc = '[S]earch current [W]ord' })

        -- Map `<leader>sg` to open Telescope's `live_grep` picker
        vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep,
            { desc = '[S]earch by [G]rep' })

        -- Map `<leader>sd` to open Telescope's `diagnostics` picker
        vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics,
            { desc = '[S]earch [D]iagnostics' })

        -- Map `<leader>sr` to open Telescope's `resume` picker
        vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume,
            { desc = '[S]earch [R]esume' })

        -- Map `<leader>sp` to open Telescope's `pickers` picker
        vim.keymap.set('n', '<leader>sp', require('telescope.builtin').pickers,
            { desc = '[S]earch [P]ickers' })

        -- Map `<leader>ds` to open Telescope's `document symbols` picker
        vim.keymap.set('n', '<leader>ds', function()
            require('telescope.builtin').lsp_document_symbols {
                symbols = {
                    "Class", "Function", "Method", "Struct", "Interface"
                }
            }
        end, { desc = 'Search [D]ocument [S]ymbols' })

        -- Map `<leader>ws` to open Telescope's `workspace symbols` picker
        vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols,
            { desc = 'Search [W]orkspace [S]ymbols' })
    end
}
