return {
  -- for jinja using none-ls
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvimtools/none-ls-extras.nvim" },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.djlint.with({
            extra_args = { "--reformat", "--format-css", "--format-js" }, -- Ensures formatting is applied
            -- filetypes = { "html", "jinja", "jinja.html", "css", "javascript" }, -- Specify file types
          }),
        },
      })
    end,
    vim.keymap.set("n", "<C-Q>", vim.lsp.buf.format, {}),
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")
      conform.setup({
        formatters_by_ft = {
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          svelte = { "prettier" },
          css = { "prettier" },
          html = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" },
          markdown = { "prettier" },
          graphql = { "prettier" },
          lua = { "stylua" },
          -- python = { "ruff" },
          python = function(bufnr)
            if require("conform").get_formatter_info("ruff_format", bufnr).available then
              return { "ruff_format" }
            else
              return { "isort", "black" }
            end
          end,
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        },
      })

      -- vim.keymap.set({ "n", "v" }, "<C-Q>", function()
      --   conform.format({
      --     lsp_fallback = true,
      --     async = false,
      --     timeout_ms = 500,
      --   })
      -- end, { desc = "Format file or range (in visual mode)" })
      vim.keymap.set({ "n", "v" }, "<leader>cf", function()
        conform.format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        })
      end, { desc = "Format file or range (in visual mode)" })
    end,
  },
}
