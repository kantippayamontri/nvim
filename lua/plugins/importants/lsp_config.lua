return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },

    -- example using `opts` for defining servers
    opts = {
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
                ignore = { "*" },
              },
            },
          },
          on_init = function(client)
            -- Explicitly set positionEncoding to UTF-8
            client.server_capabilities.positionEncoding = "utf-16"
          end,
        }, -- lua lsp servers
        ruff = {
          on_init = function(client)
            -- Explicitly set positionEncoding to UTF-8
            client.server_capabilities.positionEncoding = "utf-16"
          end,
        },
        -- docker
        dockerls = {},
        docker_compose_language_service = {},
        nginx_language_server = {},
        bashls = {},
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
      --
      -- vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      -- vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      -- vim.keymap.set("n", "rn", vim.lsp.buf.rename, {})
      -- vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})

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
