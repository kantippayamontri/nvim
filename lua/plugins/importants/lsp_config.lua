return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },

    -- example using `opts` for defining servers
    opts = {
      ensure_installed = {
        "lua_ls", -- lua lsp servers
        "pyright", -- python lsp servers
        "ruff", -- python lsp servers
        "dockerls", -- docker lsp servers
        "docker_compose_language_service", -- docker compose lsp servers
        "nginx_language_server", -- nginx lsp servers
        "bashls", -- bash lsp servers
      },
      servers = {
        lua_ls = {}, -- lua lsp servers
        pyright = {
          settings = {
            pyright = {
              -- Using Ruff's import organizer
              disableOrganizeImports = true,
            },
            python = {
              analysis = {
                -- Ignore all files for analysis to exclusively use Ruff for linting
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                ignore = { "*" },
                diagnosticMode = "off", -- Disable Pyright diagnostics entirely
              },
            },
          },
          -- on_init = function(client)
          --   -- Explicitly set positionEncoding to UTF-8
          --   client.server_capabilities.positionEncoding = "utf-16"
          -- end,
          on_attach = function(client, bufnr)
            -- Optionally disable formatting from Pyright if using Ruff
            client.server_capabilities.documentFormattingProvider = false
          end,
        }, -- lua lsp servers
        ruff = {
          -- on_init = function(client)
          --   -- Explicitly set positionEncoding to UTF-8
          --   client.server_capabilities.positionEncoding = "utf-16"
          -- end,
          on_attach = function(client, bufnr) end,
        },
        -- docker
        dockerls = {},
        docker_compose_language_service = {},
        nginx_language_server = {},
        bashls = {},
        clangd = {},
      },
    },
    config = function(_, opts)
      local lspconfig = require("lspconfig")
      for server, config in pairs(opts.servers) do
        -- passing config.capabilities to blink.cmp merges with the capabilities in your
        -- `opts[server].capabilities, if you've defined it
        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end

      -- for ruff
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client == nil then
            return
          end
          if client.name == "ruff" then
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false
          end
        end,
        desc = "LSP: Disable hover capability from Ruff",
      })
      -- end ruff

      opts.autoformat = true

      local fzf_lua = require("fzf-lua")
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gD", fzf_lua.lsp_definitions, {})
      vim.keymap.set("n", "gr", fzf_lua.lsp_references, {})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
      vim.keymap.set({ "n" }, "<leader>ca", fzf_lua.lsp_code_actions, {})
    end,
  },
}
