-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- for comment
vim.keymap.set("v", "<leader>'", function()
  vim.cmd.norm("gc")
end)

vim.keymap.set("n", "<leader>'", function()
  vim.cmd.norm("gcc")
end)

-- for neovim tab
vim.api.nvim_set_keymap("n", "<leader>th", ":tabn<CR>", { noremap = true, silent = true }) -- go to next tab
vim.api.nvim_set_keymap("n", "<leader>t;", ":tabp<CR>", { noremap = true, silent = true }) -- go to previous tab
vim.api.nvim_set_keymap("n", "<leader>tn", ":tabnew<CR>", { noremap = true, silent = true }) -- create new tab
vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", { noremap = true, silent = true }) -- close the tab

-- for neovim restart lsp server
vim.api.nvim_set_keymap("n", "<leader>lr", ":LspRestart<CR>", { desc = "Restart LSP server" })

-- for horizontal scroll
vim.api.nvim_set_keymap("n", "<S-Right>", "zL", { noremap = true, silent = true }) -- Scroll right
vim.api.nvim_set_keymap("n", "<S-Left>", "zH", { noremap = true, silent = true }) -- Scroll left

-- move line in visual mode
vim.keymap.set("v", "<leader>j", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<leader>k", ":m '<-2<CR>gv=gv")

-- for move forward with ctrl + i
vim.keymap.set("n", "<C-l>", "<C-i>", { desc = "Jump forward in the jump list" })

-- Swap the functionality of { and }
vim.keymap.set('n', '{', '}', { noremap = true, silent = true, desc = 'Swapped: Move to next paragraph' })
vim.keymap.set('n', '}', '{', { noremap = true, silent = true, desc = 'Swapped: Move to previous paragraph' })

-- Optional: Also swap in visual mode if needed
vim.keymap.set('v', '{', '}', { noremap = true, silent = true, desc = 'Swapped: Move to next paragraph (visual)' })
vim.keymap.set('v', '}', '{', { noremap = true, silent = true, desc = 'Swapped: Move to previous paragraph (visual)' })
