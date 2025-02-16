return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    config = true,
  },
  {
    "3rd/image.nvim",
    enabled = true,
    dependencies = { "luarocks.nvim" },
    opts = {},
    config = function()
      require("image").setup()
    end,
  },
}
