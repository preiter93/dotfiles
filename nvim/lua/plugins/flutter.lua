return {
    'akinsho/flutter-tools.nvim',
    dependencies = { 'mason-lspconfig.nvim', 'nvim-lua/plenary.nvim', 'stevearc/dressing.nvim' },
    opts = {
        lsp = {
            on_attach = require('utils').on_attach,
        },
        settings = {
            enableSnippets = false,
        }
    }
}
