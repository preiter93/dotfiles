return {
    'akinsho/flutter-tools.nvim',
    dependencies = { 'mason-lspconfig.nvim', 'nvim-lua/plenary.nvim', 'stevearc/dressing.nvim' },
    opts = {
        lsp = {
            on_attach = function(client, bufnr)
                require('utils').on_attach(client, bufnr, true)
            end,
        },
        settings = {
            enableSnippets = false,
        }
    }
}
