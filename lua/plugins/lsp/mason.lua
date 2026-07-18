return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require "mason"

    local mason_lspconfig = require "mason-lspconfig"

    mason.setup {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➛",
          package_uninstalled = "𐄂",
        },
      },
    }

    mason_lspconfig.setup {
      ensure_installed = {
        "rust_analyzer",
        "asm_lsp",
        "clangd",
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "emmet_ls",
        "pyright",
        "texlab",
        "jsonls",
        "bashls",
        "arduino_language_server",
      },
      automatic_installation = true, -- not the same as ensure_installed
    }
  end,
}
