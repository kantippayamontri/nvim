vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set relativenumber")
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system(
        {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
         lazypath})
end
vim.opt.rtp:prepend(lazypath)


--[[Lazy]] --
local opts = {}
require("lazy").setup("plugins", opts)

--[[Telescope]] --
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {}) -- find the name of the files 
vim.keymap.set('n', '<leader>fj', builtin.live_grep, {}) -- find the file that have the world

--[[Cappuccin]] --
-- colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin-mocha"

--[[Treesitter]] --
local configs = require("nvim-treesitter.configs")

configs.setup({
    ensure_installed = {"lua", "vim", "javascript", "html", "python", "css"}, -- we install language for highligh and indent
    sync_install = false,
    highlight = {
        enable = true
    }, -- we want syntax highligh
    indent = {
        enable = true
    } -- we want indent
})

--[[Neotree]] --
require("neo-tree").setup({
    window = {
        mappings = {
            ["P"] = {
                "toggle_preview",
                config = {
                    use_float = false,
                    use_image_nvim = true
                }
            } -- nvim will show preview without change focus
        }
    }
})
require("neo-tree").setup({
    filesystem = {
        follow_current_file = true,
        filtered_items = {
            visible = true,
            show_hidden_count = true,
            hide_dotfiles = false,
            hide_gitignored = false
        }
    }
})

vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<Cr>', {}) -- show tab filesystem in left side
vim.keymap.set('n', '<C-S-n>', ':Neotree toggle<Cr>', {}) -- toggle file system bar
