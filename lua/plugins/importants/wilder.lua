return {
  { "https://github.com/roxma/nvim-yarp" },
  {
    "https://github.com/gelguy/wilder.nvim",
    dependencies = { "nvim-yarp" },
    enabled = true,
    config = function()
      local wilder = require("wilder")
      wilder.setup({
        modes = { ":", "/", "?" },
        next_key = "<C-n>",
        previous_key = "<C-p>",
        accept_key = "<C-Y>",
      })
      -- Configure Wilder
      wilder.set_option(
        "renderer",
        wilder.popupmenu_renderer({
          highlighter = wilder.basic_highlighter(),
          left = { " ", wilder.popupmenu_devicons() },
          right = { " ", wilder.popupmenu_scrollbar() },
        })
      )

      wilder.set_option("pipeline", {
        wilder.branch(wilder.cmdline_pipeline(), wilder.search_pipeline(), wilder.python_search_pipeline()),
      })
    end,
  },
}
