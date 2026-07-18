vim.g.mapleader = " "
vim.g.maplocalleader = vim.g.mapleader

local opts = { noremap = true, silent = true }

-- vim.keymap.set({ 'n', 'v' }, '<C-N>', '<Nop>', opts)

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

vim.keymap.set({ "n", "v" }, "<C-F>", "?", { desc = "Search current file for an expression" })

-- delete a single char w/o copying into register
vim.keymap.set("n", "x", "\"_x", opts)

-- find the center
vim.keymap.set({ "n", "v" }, "<leader>m", "50%<CR>", opts)

-- showkeysToggle
vim.keymap.set("n", "<leader>sk", ":ShowkeysToggle<CR>", { desc = "Toggling Showkeys" })

vim.keymap.set({ "n", "v" }, "<CR>", "<Nop>", { desc = "Disable CR in normal and visual mode" })

-- opts.desc = 'Jump to last char/letter'
-- vim.api.nvim_set_keymap('n', 'E', '$', opts)
-- vim.api.nvim_set_keymap('v', 'E', '$', opts)

-- align in visual mode
vim.keymap.set("v", "<Tab>", ">gv", { desc = "Shift" })
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "Shift" })

-- Disable arrows
vim.keymap.set("n", "<Up>", ":echo \"use k!\"<CR>", opts)
vim.keymap.set("n", "<Down>", ":echo \"use j!\"<CR>", opts)
vim.keymap.set("n", "<Left>", ":echo \"use h!\"<CR>", opts)
vim.keymap.set("n", "<Right>", ":echo \"use l!\"<CR>", opts)

-- Buffers
opts = { noremap = true, silent = true }
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "previous buffer" })
vim.keymap.set("n", "<leader>b", ":<cmd> enew <CR>", { desc = "new buffer" })

-- Window management
vim.keymap.set("n", "<leader>v", function()
  vim.cmd "vs"
  vim.cmd.wincmd "L"
  vim.api.nvim_win_set_width(0, 100)
end, { desc = "[V]ertical Split" })
vim.keymap.set("n", "<leader>h", function()
  vim.cmd "split"
  vim.cmd.wincmd "J"
  vim.api.nvim_win_set_height(0, 20)
end, { desc = "[H]orizontal Split" })
vim.keymap.set("n", "<leader>x", ":Bdelete!<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close buffer" })

vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- keep last yanked when pasting
vim.keymap.set("v", "p", "\"_dP", opts)

vim.keymap.set("n", "<leader>kk", function()
  if vim.o.relativenumber == true then
    vim.o.relativenumber = false
  else
    vim.o.relativenumber = true
  end
end, { desc = "Reverse polarity of relativenumbers" })
-- -- Diagnostic keymaps
--vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'goto previous Diagnostic' })
--vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'goto next Diagnostic' })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Diagnostic: open float" })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Diagnostic: set loc list' })

-- Terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", opts)
vim.keymap.set("n", "<C-t>", function()
  vim.cmd "split"
  vim.cmd "term"
end, { desc = "Open terminal" })

vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

local function running_programs()
  vim.ui.input({ prompt = "Enter FileType: ", scope = "buffer" }, function(ftype)
    if ftype == "py" then
      vim.cmd("term kitty --hold python " .. vim.fn.expand "%")
    elseif ftype == "rust" then
      vim.cmd "term cargo run"
    end
  end)
end

vim.keymap.set("n", "<C-P>", running_programs, { desc = "Running program types" })

vim.api.nvim_create_augroup("exe_valgrind", { clear = false })

vim.api.nvim_create_autocmd("FileType", {
  group = "exe_valgrind",
  pattern = { "c", "cpp" },
  callback = function()
    vim.keymap.set(
      "n",
      "<C-C>",
      ":term valgrind --track-origins=yes --leak-check=full --show-leak-kinds=all -s ./%< ",
      { desc = "Executing and showing valgrind leaks" }
    )
  end,
})

-- NPM Live Server
vim.keymap.set(
  "n",
  "<leader>ls",
  function()
    vim.fn.jobstart({ "live-server" }, {
      detach = true,
      cwd = vim.fn.getcwd(),
    })
  end,
  { desc = "Start live-server in background" }
)

-- Rust Keymaps
local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set("n", "K", function() vim.cmd.RustLsp { "hover", "actions" } end, { buffer = bufnr, silent = true })

vim.keymap.set("n", "<leader>a", function() vim.cmd.RustLsp "codeAction" end, { buffer = bufnr, silent = true })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr })
