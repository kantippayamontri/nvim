-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set relativenumber")
vim.g.mapleader = " "
vim.g.background = "light"

-- for auto reload when file change form outside
vim.cmd("set autoread")
vim.cmd("autocmd FocusGained,BufEnter * checktime")
vim.cmd(
  "autocmd FileChangedShellPost * echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None"
)
vim.cmd("autocmd TextChanged,TextChangedI * checktime")
vim.cmd("autocmd CursorHold,CursorHoldI * checktime")
