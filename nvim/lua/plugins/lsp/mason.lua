return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    -- enable mason and configure icons
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
      -- list of servers for mason to install
      ensure_installed = {
        -- "rust_analyzer@2024-09-30", -- https://github.com/rust-lang/rust-analyzer/issues/18434
        "rust_analyzer",
        "lua_ls",
        "gopls",
        "ts_ls",
        "svelte",
        -- might require: npm i -g vscode-langservers-extracted
        "html",
        "pylsp",
        "cssls",
        -- "godot",
        -- "bufls", -- deprecated
      },
    })
  end,
}
