return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  cmd = {
    "Mason",
    "MasonInstall",
    "MasonUninstall",
    "MasonUninstallAll",
    "MasonLog",
    "MasonUpdate",
    "MasonUpdateAll",
  },

  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_uninstalled = "✗",
          package_pending = "⟳",
        },
      },
    })
    mason_lspconfig.setup({
      ensure_installed = {
        "tsserver",
        "html",
        "lua_ls",
        "emmet_ls",
      },
      automatic_installation = true,
    })
  end,

  build = ":MasonUpdate",
}
