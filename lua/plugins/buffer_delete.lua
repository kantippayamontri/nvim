return {
  {
    "famiu/bufdelete.nvim",
    config = function()
      vim.api.nvim_set_keymap("n", "<leader>qw", ":Bdelete<CR>", { noremap = true, silent = true })
    end,
  },
}
