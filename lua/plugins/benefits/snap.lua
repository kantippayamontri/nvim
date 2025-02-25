return {
  {
    "mistricky/codesnap.nvim",
    build = "make",
    keys = {
      { "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
      { "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
    },
    config = function()
      require("codesnap").setup({
        -- The save_path must be ends with .png, unless when you specified a directory path,
        -- CodeSnap will append an auto-generated filename to the specified directory path
        -- For example:
        save_path = "~/Pictures",
        parsed = "~/Pictures/CodeSnap_y-m-d_at_h:m:s.png",
        border = "rounded",
        has_breadcrumbs = true,
        bg_theme = "grape", -- bamboo, sea, peach, grape, dusk, summer
        watermark = "",
      })
    end,
  },
}
