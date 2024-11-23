return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim",                   opts = {} },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

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
    local server_settings = {
      rust_analyzer = {
        checkOnSave = {
          command = "clippy",
        },
      },
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
      gopls = {
        buildFlags = { "-tags=smoketest" },
        testTags = "smoketest",
        env = { GOFLAGS = "-tags=smoketest" },
      },
      -- configs.gopls = {
      --   default_config = {
      --     cmd = {'gopls', '--remote=auto'},
      --     filetypes = { "go", "gomod" },
      --     settings = {
      --       gopls = {
      --         usePlaceholders = true,
      --         buildFlags =  {"-tags=integration"},
      --         gofumpt = true,
      --       }
      --     },
      --   }
      -- }
    }
    -- set keybindings
    mason_lspconfig.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
          on_attach = utils.on_attach,
          settings = server_settings[server_name],
        })
      end,
    })
  end
}
