return {

  { "WhoIsSethDaniel/mason-tool-installer.nvim" },

  {
    "williamboman/mason.nvim",
    dependencies = {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    lazy = false,
    opts = {
      ensure_installed = { "hadolint" },
    },
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
    config = function()
      require("mason-lspconfig").setup({
        -- ensure_installed = { "lua_ls", "pylsp", "html", "tsserver", "cssmodules_ls" },
        ensure_installed = {
          "ts_ls",
          "lua_ls",
          "ruff",
          "pyright",
          "docker_compose_language_service",
          "dockerls",
          "nginx_language_server",
          "yamlls", -- yaml language server
        },
        opts = {
          auto_install = true,
        },
      })

      local mason_tool_installer = require("mason-tool-installer")
      mason_tool_installer.setup({
        ensure_installed = {
          "prettier", -- prettier formatter
          "stylua", -- lua formatter
          "ruff", --python formatter and linter
          -- "isort", -- python formatter
          -- "black", -- python formatter
          -- "pylint", -- python linter
          "eslint_d", -- js linter
          "djlint", -- for flask and django template linting
          "yamllint", -- for yaml linting
        },
      })
    end,
  },
}
