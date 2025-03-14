return {
  -- buffer delete
  {
    "famiu/bufdelete.nvim",
    config = function()
      vim.api.nvim_set_keymap("n", "<leader>qw", ":Bdelete<CR>", { noremap = true, silent = true })
    end,
  },
  -- bufferline
  {
    "https://github.com/akinsho/bufferline.nvim",
    dependecies = { "nvim-web-devicons" },
    enabled = true,
    event = "VeryLazy",
    keys = {
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
      { "<leader>qe", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" }, -- delete previous tab
      { "<leader>qq", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" }, -- delete next tab
      { "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev Buffer" }, -- navigate previous buffer
      { "<S-l>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next Buffer" }, -- navigate next buffer
      { "<leader>h", "<Cmd>BufferLineMovePrev<CR>", desc = "Move buffer prev" },
      { "<leader>l", "<Cmd>BufferLineMoveNext<CR>", desc = "Move buffer next" },
    },
  },
}
