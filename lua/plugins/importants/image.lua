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
      require("lazy").setup({
        rocks = {
          hererocks = true, -- recommended if you do not have global installation of Lua 5.1.
        },
        spec = {
          {
            "3rd/image.nvim",
            opts = {},
          },
        },
      })
    end,
  },
}
