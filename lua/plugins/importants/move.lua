return {
  {
    "nvim-mini/mini.move",
    enabled = false,
    version = "*",
    config = function()
      require("mini.move").setup()
    end,
  },
  {
    "https://github.com/matze/vim-move",
  },
}
