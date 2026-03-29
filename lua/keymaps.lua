local M = {}

function M.setup()
  local map = vim.keymap.set
  local opts = { noremap = true, silent = true }

  -- Terminal
  vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", opts)
  vim.keymap.set("t", "<C-e>", "<cmd> q <CR> :bnext<CR> :Bdelete!<CR>", opts)
  vim.keymap.set("t", "<C-q>", "<C-\\><C-n> :wincmd h<CR>", opts)
  vim.keymap.set("n", "<C-t>", function()
    vim.cmd "split"
    vim.cmd.term()
    vim.cmd.wincmd "J"
    vim.api.nvim_win_set_height(0, 10)
  end, { desc = "Open terminal" })

  vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
    callback = function()
      vim.opt.number = false
      vim.opt.relativenumber = false
    end,
  })

  -- Telescope keymaps
  map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
  map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
  map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
  map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)

  -- Buffers
  vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "next buffer" })
  vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "previous buffer" })
  -- vim.keymap.set( 'n', '<leader>x', ':Bdelete!<CR>', opts )
  vim.keymap.set("n", "<leader>b", ":<cmd> enew <CR>", { desc = "new buffer" })

  -- LSP diagnostics
  vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "show diagnostics" })
end

return M
