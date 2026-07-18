local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then error("Error cloning lazy.nvim:\n" .. out) end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "mg979/vim-visual-multi",
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },
  {
    require "plugins.lsp.lspconfig",
    require "plugins.lsp.mason",
    require "plugins.lsp.autoformat",
    require "plugins.lsp.lua",

    require "plugins.colorschemes.cyberdream",

    require "plugins.aerial",
    require "plugins.arduino",
    require "plugins.autopairs",
    require "plugins.autotag",
    require "plugins.bufferline",
    require "plugins.cmp",
    require "plugins.fterm",
    require "plugins.lualine",
    require "plugins.neotree",
    require "plugins.presence",
    require "plugins.telescope",
    require "plugins.treesitter",
    require "plugins.vimtex",
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        html = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettierd", "prettier", stop_after_first = true },
        scss = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
        yaml = { "prettierd", "prettier", stop_after_first = true },
        markdown = { "prettierd", "prettier", stop_after_first = true },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    },
  },
}
