return {{
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
}, -- cappuccin
{
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6', -- telescope
    dependencies = {'nvim-lua/plenary.nvim'}
}, {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
}, -- treesitter
{
    "nvim-neo-tree/neo-tree.nvim", -- neo-tree
    branch = "v3.x",
    dependencies = {"nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim"}
}}
