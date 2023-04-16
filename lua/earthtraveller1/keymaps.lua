vim.g.mapleader = " "

-- For making it easier to move around.
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- ThePrimeagen's greatest remap ever.
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Easier time exiting NeoVim.
vim.keymap.set("n", "<leader>qq", "<Cmd>wqa<CR>")

-- Opening fugitive in a better way.
vim.keymap.set("n", "<leader>gi", "<Cmd>Git<CR><C-w>L<C-w>60<")

-- Opening the symbol outline.
vim.keymap.set("n", "<leader>so", "<Cmd>SymbolsOutline<CR>")
