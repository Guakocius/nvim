if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
  config = function()
    local jdtls = require "jdtls"
    local home = os.getenv "HOME"
    local util = require "jdtls.setup"
    local lspconfig_util = require "lspconfig.util"
    local jdtls_path = vim.fn.stdpath "data" .. "/mason/packages/jdtls"
    local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
    local root_dir = lspconfig_util.root_pattern(unpack(root_markers))(vim.fn.getcwd())
    if not root_dir then
      local current_file = vim.api.nvim_buf_get_name(0)
      root_dir = lspconfig_util.root_pattern "src"(current_file) or vim.fn.fnamemodify(current_file, ":h")
    end

    local workspace_dir = vim.fn.stdpath "cache" .. "/jdtls/workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

    local config = {
      cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xms1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",
        "-jar",
        vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
        "-configuration",
        jdtls_path .. "/config_linux", -- or config_mac, config_win
        "-data",
        workspace_dir,
      },
      root_dir = root_dir,
      settings = {
        java = {},
      },
    }

    jdtls.start_or_attach(config)
  end,
}
