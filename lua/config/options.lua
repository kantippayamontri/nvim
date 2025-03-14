-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set relativenumber")
vim.g.mapleader = " "
vim.g.background = "dark"
vim.o.background = "dark"
vim.opt.termguicolors = true

vim.opt.autoread = true -- auto reload when file change from outside

vim.keymap.set("n", "s", "<Nop>", { silent = true })

-- for auto reload when file change form outside
vim.cmd("set autoread")
vim.cmd("autocmd FocusGained,BufEnter * checktime")
vim.cmd(
  "autocmd FileChangedShellPost * echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None"
)
vim.cmd("autocmd TextChanged,TextChangedI * checktime")
vim.cmd("autocmd CursorHold,CursorHoldI * checktime")

vim.g.lazyvim_mini_snippets_in_completion = true

-- show file name in the top
vim.o.winbar = "%f"

-- Neovim default updatetime is 4000
vim.opt.updatetime = 200

-- autosave
vim.o.autowriteall = true

vim.opt.clipboard = "unnamedplus"

-- LSP Server to use for Python.
-- Set to "basedpyright" to use basedpyright instead of pyright.
vim.g.lazyvim_python_lsp = "pyright"
-- Set to "ruff_lsp" to use the old LSP implementation version.
vim.g.lazyvim_python_ruff = "ruff"

-- for augment ai
_G.augment_workspace_folders =
  { "/home/kan/Work/Project/ABC_API/project/web", "/home/kan/Work/Project/serpapi_tutorial" }
-- vim.cmd("let g:augment_workspace_folders = ['/home/kan/Work/Project/ABC_API/project/web', '/home/kan/Work/Project/serpapi_tutorial']")
