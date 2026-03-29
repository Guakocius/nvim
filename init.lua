-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  local result = vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
  if vim.v.shell_error ~= 0 then
    -- stylua: ignore
    vim.api.nvim_echo({ { ("Error cloning lazy.nvim:\n%s\n"):format(result), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
    vim.fn.getchar()
    vim.cmd.quit()
  end
end

vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"

-- transparent background
vim.cmd [[
  hi Normal       guibg=NONE ctermbg=NONE
  hi NormalNC     guibg=NONE ctermbg=NONE
  hi EndOfBuffer  guibg=NONE ctermbg=NONE
  hi SignColumn   guibg=NONE ctermbg=NONE
  hi VertSplit    guibg=NONE ctermbg=NONE
  hi StatusLine   guibg=NONE
  hi StatusLineNC guibg=NONE
  hi LineNr       guibg=NONE
  hi Folded       guibg=NONE
  hi NonText      guibg=NONE
  hi SpecialKey   guibg=NONE
  hi TermNormal   guibg=NONE

  hi NeoTreeNormal guibg=NONE
  hi NeoTreeNormalNC guibg=NONE
  hi NeoTreeEndOfBuffer guibg=NONE
  hi NeoTreeWinSeparator guibg=NONE
  hi NeoTreeVertSplit guibg=NONE
  hi NeoTreeFloatBorder guibg=NONE

  hi NeoTreeDirectoryName guifg=#89b4fa
  hi NeoTreeDirectoryIcon guifg=#89b4fa
  hi NeoTreeFileName guifg=#cdd6f4
  hi NeoTreeFileIcon guifg=#fab387
  hi NeoTreeFileNameOpened guifg=#a6e3a1
  hi NeoTreeHiddenByName guifg=#6c7086
  hi NeoTreeGitModified guifg=#f9e2af
  hi NeoTreeGitAdded guifg=#a6e3a1
  hi NeoTreeGitDeleted guifg=#f38ba8
  hi NeoTreeGitUntracked guifg=#89dceb
  hi NeoTreeCursorLine guifg=#717274


  hi NormalFloat guibg=NONE
  hi FloatBorder guibg=NONE
  hi Pmenu guibg=NONE
  hi PmenuSel guibg=NONE
  hi TelescopeNormal guibg=NONE
  hi TelescopeBorder guibg=NONE
]]
