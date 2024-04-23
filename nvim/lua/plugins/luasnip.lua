return {
  "L3MON4D3/LuaSnip",
  event = { "BufReadPre", "BufNewFile" },
  version = "v2.*",
  build = "make install_jsregexp",
  -- dependencies = { "rafamadriz/friendly-snippets" },
  config = function(_)
    require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets" } })
  end
}
