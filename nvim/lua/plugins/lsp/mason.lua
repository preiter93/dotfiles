return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")

    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "rust_analyzer",
        "lua_ls",
        "gopls",
        "ts_ls",
        "svelte",
        -- might require: npm i -g vscode-langservers-extracted
        "html",
        "pylsp",
        "cssls",
      },
    })
  end,
}
