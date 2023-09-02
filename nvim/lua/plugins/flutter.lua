-- load the utils module
package.path = package.path .. ';../utils/?.lua'
local utils = require('utils')

return {
    'akinsho/flutter-tools.nvim',
    after = "mason-lspconfig.nvim",                                    -- make sure to load after mason-lspconfig
    dependencies = { 'nvim-lua/plenary.nvim', 'stevearc/dressing.nvim' -- optional for vim.ui.select
    },
    opts = {
        lsp = {
            on_attach = utils.on_attach,
        },
    }
}
