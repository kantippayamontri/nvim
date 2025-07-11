return {
  {
    -- https://github.com/RRethy/vim-illuminate
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    config = function()
      local ilmn = require("illuminate")
      ilmn.configure({
        delay = 250,
        filetype_denylist = {
          "markdown",
          "rst",
        },
        min_count_to_highlight = 2,
      })

      vim.keymap.set("n", "<C-k>", ilmn.goto_prev_reference, { desc = "illuminate: [p]rev" })
      vim.keymap.set("n", "<C-j>", ilmn.goto_next_reference, { desc = "illuminate: [n]ext" })
    end,
  },
}
