return {
    { "nvim-lua/plenary.nvim", lazy = true },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = {
                    "lua",
                    "vim",
                    "python",
                    "dockerfile",
                    "ninja",
                    "rst",
                    "jinja",
                    "html",
                },
                ignore_install = {},
                auto_install = true,
                sync_install = false,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = { "jinja" }, -- Fallback for Jinja-specific syntax
                    custom_captures = {
                        -- Map jinja filetype to use html parser
                        ["jinja"] = "html",
                    },
                },
                indent = {
                    enable = true,
                },
            })
        end,
    },
    -- for raninbow delimeter
    {
        "https://github.com/hiphish/rainbow-delimiters.nvim",
        enabled = true,
    },
    -- for vim-jinja format
    {
        "https://github.com/lepture/vim-jinja",
        enabled = true,
    }
}
