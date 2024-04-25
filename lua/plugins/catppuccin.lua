return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy=false,
    priority = 1000,
    config = function()
      --[[Cappuccin]] --
      -- colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
      -- require("catppuccin").setup()
      vim.cmd.colorscheme "catppuccin-mocha"
    end
} -- cappuccin
