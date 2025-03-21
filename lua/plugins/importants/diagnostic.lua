return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    enabled = true,
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    config = function()
      require("tiny-inline-diagnostic").setup({
        preset = "amongus", -- modern, classic, minimal, powerline, simple, nonerfont, ghost, amongus
        options = {
          show_source = true,
        },
      })
      vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
    end,
  },
}
