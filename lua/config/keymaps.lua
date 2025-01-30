-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- for comment
vim.keymap.set("v", "'", function()
  vim.cmd.norm("gc")
end)

vim.keymap.set("n", "'", function()
  vim.cmd.norm("gcc")
end)

-- for neovim tab
vim.api.nvim_set_keymap("n", "<Tab>", ":tabn<CR>", { noremap = true, silent = true }) -- go to next tab
vim.api.nvim_set_keymap("n", "<S-Tab>", ":tabp<CR>", { noremap = true, silent = true }) -- go to previous tab
vim.api.nvim_set_keymap("n", "<leader>tn", ":tabnew<CR>", { noremap = true, silent = true }) -- create new tab
vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", { noremap = true, silent = true }) -- close the tab

-- for neovim restart lsp server
vim.api.nvim_set_keymap("n", "<leader>lr", ":LspRestart<CR>", {desc = "Restart LSP server"})

-- for horizontal scroll
vim.api.nvim_set_keymap('n', '<S-Right>', 'zL', { noremap = true, silent = true }) -- Scroll right
vim.api.nvim_set_keymap('n', '<S-Left>', 'zH', { noremap = true, silent = true })  -- Scroll left
