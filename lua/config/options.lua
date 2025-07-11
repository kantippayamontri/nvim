-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.encoding = "utf-8" -- for showing nice unicode -> emoji

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.opt.relativenumber = false -- disable relative number
vim.opt.updatetime = 100 -- reduce the delay before neovim update the screen
vim.opt.swapfile = false -- Swap files can slow down file operations
vim.g.mapleader = " "
vim.g.background = "dark"
vim.o.background = "dark"
vim.opt.termguicolors = true

vim.opt.autoread = true -- auto reload when file change from outside

vim.keymap.set("n", "s", "<Nop>", { silent = true })

-- for auto reload when file change form outside
-- vim.cmd("set autoread")
-- vim.cmd("autocmd FocusGained,BufEnter * checktime")
-- vim.cmd(
--   "autocmd FileChangedShellPost * echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None"
-- )
-- vim.cmd("autocmd TextChanged,TextChangedI * checktime")
-- vim.cmd("autocmd CursorHold,CursorHoldI * checktime")

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

-- for cursor size
vim.cmd([[
  autocmd VimLeave * set guicursor= | call chansend(v:stderr, "\x1b[ q")
]])

-- for vim diagnostic
vim.diagnostic.config({
  -- virtual_text = true, -- Show diagnostics inline
  virtual_text = {
    prefix = "", -- Customize the marker
    spacing = 2, -- 4 spaces between code and virtual text
    -- suffix = " ⛺", -- Symbol after the message
    format = function(diagnostic)
      local show_text = "🔵"
      local end_text = "⛺"
      if
        diagnostic.severity == vim.diagnostic.severity.ERROR
        or string.find(diagnostic.message:lower(), "error", 1, true)
      then
        show_text = "⛔"
      elseif diagnostic.severity == vim.diagnostic.severity.WARN then
        show_text = "😭"
      end

      if diagnostic.source == "Ruff" then --fix for ruff show diagnostic for "ruff" and "Ruff" same text -> show only ruff
        return ""
      end
      return string.format("%s  %s %s", show_text, diagnostic.message, end_text)
    end,
  },
  -- signs = true, -- Show signs in the gutter
  signs = {
    active = true,
    values = {
      { name = "DiagnosticSignError", text = "✘" },
      { name = "DiagnosticSignWarn", text = "▲" },
      { name = "DiagnosticSignInfo", text = "ℹ" },
      { name = "DiagnosticSignHint", text = "➤" },
    },
  },
  update_in_insert = false, -- Don’t update diagnostics while typing
  severity_sort = true, -- Sort by severity
  float = {
    border = "single", -- Optional: rounded borders for floating diagnostics
  },
})

-- for c++
vim.keymap.set("n", "<leader>cc", ":w<CR>:!clang++ % -o %:r && ./%:r<CR>", { noremap = true, silent = true })
