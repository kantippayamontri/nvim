return {
  -- this plugin use for auto-save file without :w
  {
    "Pocco81/auto-save.nvim",
    config = function()
      vim.api.nvim_set_keymap("n", "<leader>n", ":ASToggle<CR>", {}) -- toggle auto-save
    end,
  },
}
