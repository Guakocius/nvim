return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require "conform"

      conform.setup {
        formatters_by_ft = {
          lua = { "stylua" },
          c = { "clang-format" },
          cpp = { "clang-format" },

          svelte = { "prettierd", "prettier", stop_after_first = true },
          javascript = { "prettierd", "prettier", stop_after_first = true },
          typescript = { "prettierd", "prettier", stop_after_first = true },
          javascriptreact = { "prettierd", "prettier", stop_after_first = true },
          typescriptreact = { "prettierd", "prettier", stop_after_first = true },
          json = { "prettierd", "prettier", stop_after_first = true },
          graphql = { "prettierd", "prettier", stop_after_first = true },
          markdown = { "prettierd", "prettier", stop_after_first = true },
          css = { "prettierd", "prettier", stop_after_first = true },
          scss = { "prettierd", "prettier", stop_after_first = true },
          html = { "prettierd", "prettier", stop_after_first = true },

          java = { "google-java-format" },
          kotlin = { "ktlint" },
          bash = { "beautysh" },
          proto = { "buf" },
          rust = { "rustfmt" },
          toml = { "taplo" },
        },

        format_on_save = {
          timeout_ms = 500,
          lsp_format = "fallback",
        },
      }

      vim.keymap.set(
        { "n", "v" },
        "<leader>f",
        function()
          conform.format {
            async = false,
            timeout_ms = 500,
            lsp_format = "fallback",
          }
        end,
        { desc = "Format file or range" }
      )
    end,
  },
}
