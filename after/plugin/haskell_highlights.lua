local function haskell_highlights()
  -- Built-in/Vim Haskell syntax group
  vim.api.nvim_set_hl(0, "VarId", { link = "Function" })

  -- Tree-sitter groups, if active
  vim.api.nvim_set_hl(0, "@variable.haskell", { link = "Function" })
  vim.api.nvim_set_hl(0, "@function.haskell", { link = "Function" })
  vim.api.nvim_set_hl(0, "@function.call.haskell", { link = "Function" })

  vim.api.nvim_set_hl(0, "@type.haskell", { link = "Type" })
  vim.api.nvim_set_hl(0, "@constructor.haskell", { link = "Type" })
  vim.api.nvim_set_hl(0, "@keyword.haskell", { link = "Keyword" })
  vim.api.nvim_set_hl(0, "@operator.haskell", { link = "Operator" })
end

haskell_highlights()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = haskell_highlights,
})
