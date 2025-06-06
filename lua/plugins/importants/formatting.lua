return {
    -- use for format djlint for jinja template
    {
        "nvimtools/none-ls.nvim",
        enabled = false,
        dependencies = { "nvimtools/none-ls-extras.nvim" },
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.djlint.with({
                        extra_args = { "--reformat", "--format-css", "--format-js" }, -- Ensures formatting is applied
                        filetypes = { "jinja", "jinja.html", "css", "javascript" }, -- Specify file types
                        -- filetypes = { "html", "jinja", "jinja.html", "css", "javascript" }, -- Specify file types
                    }),
                },
            })
        end,
        vim.keymap.set("n", "<C-Q>", vim.lsp.buf.format, {}),
    },
    {
        "stevearc/conform.nvim",
        enabled = true,
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local conform = require("conform")
            conform.setup({
                formatters_by_ft = {
                    -- Map filetypes for Jinja templates
                    ["jinja"] = { "djlint" },
                    ["jinja.html"] = { "djlint" },
                    ["html"] = { "djlint" }, -- If your Jinja templates use .html
                    -- end setup for jinja
                    javascript = { "prettier" },
                    typescript = { "prettier" },
                    javascriptreact = { "prettier" },
                    typescriptreact = { "prettier" },
                    svelte = { "prettier" },
                    css = { "prettier" },
                    -- html = { "prettier" },
                    json = { "prettier" },
                    yaml = { "prettier" },
                    markdown = { "prettier" },
                    graphql = { "prettier" },
                    lua = { "stylua" },
                    docker = { "dockerls" },
                    sh = { "shfmt" },
                    -- python = { "ruff" },
                    --
                    -- python = function(bufnr)
                    --   if require("conform").get_formatter_info("ruff_format", bufnr).available then
                    --     return { "ruff_format" }
                    --   else
                    --     return { "isort", "black" }
                    --   end
                    -- end,
                    python = {
                        -- To fix auto-fixable lint errors.
                        "ruff_fix",
                        -- To run the Ruff formatter.
                        "ruff_format",
                        -- To organize the imports.
                        "ruff_organize_imports",
                    },
                },
                -- format_on_save = {
                --   lsp_fallback = true,
                --   async = false,
                --   timeout_ms = 500,
                -- },
                format_on_save = false,
            })

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
