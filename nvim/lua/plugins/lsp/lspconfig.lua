return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim",                   opts = {} },
  },
  config = function()
    -- import mason_lspconfig plugin
    local mason_lspconfig = require("mason-lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- load the utils package
    local utils = require('utils')

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

    -- set server specific settings
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
          diagnostics = {
            globals = { 'vim' }
          }
        },
      }
    })
    vim.lsp.config("rust_analyzer", {
      settings = {
        checkOnSave = {
          command = "clippy",
        },
      }
    })
    vim.lsp.config("gopls", {
      settings = {
        buildFlags = { "-tags=smoketest" },
        testTags = "smoketest",
        env = { GOFLAGS = "-tags=smoketest" },
      }
    })

    mason_lspconfig.setup({})

    -- on attach
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        client.capabilities = capabilities;
        utils.on_attach(client, event.buf)
      end
    })
  end
}
