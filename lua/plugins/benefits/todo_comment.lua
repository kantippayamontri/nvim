return {
  -- TODO:
  -- HACK:
  -- WARN:
  -- PERF:
  -- NOTE:
  -- TEST:
  {
    "https://github.com/folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    optional = true,
    keys = {
      {
        "<leader>st",
        function()
          require("todo-comments.fzf").todo()
        end,
        desc = "Todo",
      },
      {
        "<leader>sT",
        function()
          require("todo-comments.fzf").todo({ keywords = { "TODO", "FIX", "FIXME" } })
        end,
        desc = "Todo/Fix/Fixme",
      },
    },
  },
}
