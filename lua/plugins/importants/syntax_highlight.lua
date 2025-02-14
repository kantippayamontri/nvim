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
        },
        ignore_install = {},
        auto_install = true,
        sync_install = false,
        highlight = { enable = true },
        indent = {
          enable = true,
        },
      })
    end,
  },
    -- for raninbow delimeter
  {
    "https://github.com/hiphish/rainbow-delimiters.nvim",
  },
}
