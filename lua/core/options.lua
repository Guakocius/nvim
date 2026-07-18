vim.wo.number = true

vim.o.relativenumber = true
vim.o.clipboard = "unnamedplus"
vim.o.wrap = true
vim.o.linebreak = true
vim.o.mouse = "a"
vim.o.autoindent = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

vim.g.copilot_enabled = false

vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.colorcolumn = "80"
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#2E3440" })
vim.opt.virtualedit = "block"
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
