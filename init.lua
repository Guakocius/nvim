require "core.keymaps"
require "core.options"
require "config.lazy"
require "luasnip"

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
