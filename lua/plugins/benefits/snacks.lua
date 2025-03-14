return {
  -- lazy.nvim
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      animate = {enabled = true}, -- use easy motion
      bigfile = {enabled = true}, -- do not use lsp when the file is big (default 1.5 mb)
      lazygit = {enabled = true},
      picker = {enabled = true},
      quickfile = {enabled = true},
      scroll = {enabled = true},
    },
  },
}
