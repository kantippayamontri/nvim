return {
  {
    -- amongst your other plugins
    -- { "akinsho/toggleterm.nvim", version = "*", config = true },
    -- or
    {
      "akinsho/toggleterm.nvim",
      version = "*",
      opts = {--[[ things you want to change go here]]
      },
      config = function(_, opts)
        on_open = function(term)
          vim.cmd('normal! g`"') -- Restore cursor position when opening
        end
        on_close = function(term)
          vim.cmd("normal! m`") -- Save cursor position before closing
        end
        require("toggleterm").setup({
          size = 20,
          open_mapping = [[<C-t>]],
          direction = "float",
          float_opts = {
            border = "curved",
          },
        })
      end,
    },
  },
}
