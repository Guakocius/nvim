return {
  "andweeb/presence.nvim",
  event = "VeryLazy",
  config = function()
    require("presence").setup({
      auto_update = true,
      neovim_image_text = "I use NixOS btw",
      main_image = "neovim",
      debounce_timeout = 10,
      enable_line_number = true,
      buttons = true,
    })
  end
}
