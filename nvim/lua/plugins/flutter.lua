return {
    'nvim-flutter/flutter-tools.nvim',
    dependencies = { 'mason-lspconfig.nvim', 'nvim-lua/plenary.nvim', 'stevearc/dressing.nvim' },
    config = function()
        require("flutter-tools").setup {
            lsp = {
                on_attach = function(client, bufnr)
                    -- force-enable go-to-definition. Fixes "method textDocument/definition is not supported" issue.
                    -- client.server_capabilities.definitionProvider = true
                    require('utils').on_attach(client, bufnr, true)

                    if vim.bo[bufnr].filetype == "dart" then
                        local opts = { noremap = true, silent = true }

                        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>fo', ':FlutterOutlineToggle<CR>',
                            { noremap = true, silent = true, desc = '[F]lutter [O]utline Toggle' })
                        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>fr', ':FlutterRun<CR>',
                            { noremap = true, silent = true, desc = '[F]lutter [R]un' })
                        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>fq', ':FlutterQuit<CR>',
                            { noremap = true, silent = true, desc = '[F]lutter [Q]uit' })
                        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>fh', ':FlutterReload<CR>',
                            { noremap = true, silent = true, desc = '[F]lutter [H]ot Reload' })
                        -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>fa', ':FlutterAttach<CR>',
                        -- { noremap = true, silent = true, desc = '[F]lutter [A]attach' })
                        -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>fd', ':FlutterDetach<CR>',
                        --     { noremap = true, silent = true, desc = '[F]lutter [D]etach' }
                        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>fv', ':FlutterVisualDebug<CR>',
                            { noremap = true, silent = true, desc = '[F]lutter [V]isual Debug' })
                    end
                end,
            },
            settings = {
                enableSnippets = false,
            },
        }
        require('flutter-tools').setup_project({
            name = 'Web',
            device = 'chrome',
            web_port = "8080",
        })
    end
}
