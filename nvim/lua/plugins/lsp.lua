-- load the utils module
package.path = package.path .. ';../utils/?.lua'
local utils = require('utils')

return {
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
    config = function(_, _)
      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. They will be passed to
      --  the `settings` field of the server config. You must look up that documentation yourself.
      local servers = {
        -- clangd = {},
        gopls = {},
        -- pyright = {},
        rust_analyzer = {
          -- enable clippy on save
          checkOnSave = {
            command = "clippy",
          },
        },
        -- tsserver = {},
        svelte = {},
        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
      }
      -- Setup neovim lua configuration
      require('neodev').setup()
      -- local ensure_installed = vim.tbl_keys(servers)
      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
      -- setup
      require('mason').setup()
      require("mason-lspconfig").setup {
        ensure_installed = vim.tbl_keys(servers),
      }
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = utils.on_attach,
            settings = servers[server_name],
          }
        end,
      })
    end,
  }
}
