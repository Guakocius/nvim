return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    local signs = { Error = "⚔ ", Warn = "⚠ ", Hint = "⨁ ", Info = "ℹ " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    local lstypes = {
      "html",
      "cssls",
      "tailwindcss",
      "jsonls",
      "bashls",
      "arduino_language_server",
      "pkgbuild_language_server",
      "emmet_ls",
      "pyright",
      "rust_analyzer",
      "cmake",
      "clangd",
      "asm_lsp",
      "texlab",
      "lua_ls",
    }

    for _, ls in ipairs(lstypes) do
      vim.lsp.enable(ls)
      if ls == "emmet_ls" then
        vim.lsp.config(ls, {
          capabilities = capabilities,
          filetypes = { "html", "css", "sass", "scss", "less", "svelte" },
        })
      elseif ls == "clangd" then
        vim.lsp.config(ls, {
          capabilities = capabilities,
          cmd = {
            "clangd",
            "--compile-commands-dir=builddir",
            "--background-index",
            "--clang-tidy",
          },
          handlers = {
            ["window/showMessage"] = function(params) print(vim.inspect(params)) end,
          },
        })
      elseif ls == "lua_ls" then
        vim.lsp.config(ls, {
          on_init = function(client)
            if client.workspace_folders then
              local path = client.workspace_folders[1].name
              if
                path ~= vim.fn.stdpath "config"
                and (vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc"))
              then
                return
              end
            end
            client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
              runtime = {
                version = "LuaJIT",
              },
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME,
                },
              },
            })
          end,
          settings = {
            Lua = {},
          },
        })
      else
        vim.lsp.config(ls, {
          capabilities = capabilities,
        })
      end
    end
  end,
}
