return {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
       -- require("cyberdream.nvim").setup({
      vim.cmd.colorscheme('cyberdream')
      -- Own Highlighting of Identifiers, variables and properties
      vim.api.nvim_set_hl(0, "Identifier", { fg = "#89b4fa" })
      vim.api.nvim_set_hl(0, "@variable", { fg = "#cdd6f4" })
      vim.api.nvim_set_hl(0, "@property.lua", { fg = "#f9e2af" })
      vim.api.nvim_set_hl(0, "@lsp.type.property.lua", { fg = "#f9e2af" })
       --      })
    end
}

