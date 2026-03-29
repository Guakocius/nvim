return {
  "scalameta/nvim-metals",
  dependencies = { "nvim-lua/plenary.nvim" },
  ft = { "scala", "sbt" },
  config = function()
    local metals = require "metals"
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local metals_config = metals.bare_config()
    metals_config.settings = {
      showImplicitArguments = true,
      showInferredType = true,
    }
    metals_config.capabilities = capabilities
    metals_config.init_options.statusBarProvider = "on"

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "scala", "sbt" },
      callback = function() metals.initialize_or_attach(metals_config) end,
    })
  end,
}

--[[    metals_config.on_attach = function(client, bufnr)
        -- your on_attach function
      end

      return metals_config
    end,
    config = function(self, metals_config)
      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = self.ft,
        callback = function() require("metals").initialize_or_attach(metals_config) end,
        group = nvim_metals_group,
      })
    end,
  },
}--]]
