-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("v", "'", function()
  vim.cmd.norm("gc")
end)

vim.keymap.set("n", "'", function()
  vim.cmd.norm("gcc")
end)
