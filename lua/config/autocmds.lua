-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--

-- vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
--   pattern = "*",
--   command = "checktime",
-- })

-- vim.api.nvim_create_autocmd("TabEnter", {
--   callback = function()
--     local buffers = vim.api.nvim_list_bufs()
--     for _, buf in ipairs(buffers) do
--       if not vim.api.nvim_buf_is_loaded(buf) then
--         vim.cmd("bdelete " .. buf)
--       end
--     end
--   end,
-- })

-- always write file -> autosave
vim.api.nvim_create_autocmd({ "InsertLeavePre", "TextChanged", "TextChangedP" }, {
  pattern = "*",
  callback = function()
    vim.cmd("silent! write")
  end,
})
