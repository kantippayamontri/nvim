return {
  {
    "https://github.com/SmiteshP/nvim-navic",
    dependecies = { "neovim/nvim-lspconfig" },
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
  },
}
