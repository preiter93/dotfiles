-- load the utils module
package.path = package.path .. ';../utils/?.lua'
local utils = require('utils')

return {
    'akinsho/flutter-tools.nvim',
    dependencies = { 'mason-lspconfig.nvim', 'nvim-lua/plenary.nvim', 'stevearc/dressing.nvim' },
    opts = {
        lsp = {
            on_attach = utils.on_attach,
        },
        settings = {
            enableSnippets = false,
        }
    }
}
