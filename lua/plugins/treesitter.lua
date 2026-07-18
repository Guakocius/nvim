return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup {
        install_dir = vim.fn.stdpath "data" .. "/site",
      }
      require("nvim-treesitter").install {
        "lua",
        "python",
        "javascript",
        "typescript",
        "vimdoc",
        "vim",
        "regex",
        "terraform",
        "sql",
        "dockerfile",
        "toml",
        "json",
        "gitignore",
        "yaml",
        "make",
        "cmake",
        "markdown",
        "markdown_inline",
        "bash",
        "tsx",
        "css",
        "html",
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "html",
          "css",
          "javascript",
          "typescript",
          "typescriptreact",
          "javascriptreact",
          "tsx",
          "lua",
          "rust",
          "c",
        },
        callback = function(args) vim.treesitter.start(args.buf) end,
      })
    end,
  },
}
