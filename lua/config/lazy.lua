local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then error("Error cloning lazy.nvim:\n" .. out) end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

vim.g.rustaceanvim = {
  tools = {},
  server = {
    on_attach = function(client, bufnr) end,
    default_settings = {
      ["rust-analyzer"] = {},
    },
  },
  dap = {},
}

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
    require "plugins.lsp.autoformat",
    require "plugins.lsp.conform",
    require "plugins.lsp.lspconfig",
    require "plugins.lsp.lua",
    require "plugins.lsp.mason",
    require "plugins.lsp.mini_indentscope",
    require "plugins.lsp.rust-analyzer",
    require "lua.plugins.lsp.vim-matchup",

    require "plugins.colorschemes.cyberdream",

    require "plugins.aerial",
    require "plugins.arduino",
    require "plugins.autopairs",
    require "plugins.autotag",
    require "plugins.bufferline",
    require "plugins.cmp",
    require "plugins.cord",
    require "plugins.fterm",
    require "plugins.lualine",
    require "plugins.neotree",
    require "plugins.telescope",
    require "plugins.treesitter",
    require "plugins.vimtex",
  },
}
