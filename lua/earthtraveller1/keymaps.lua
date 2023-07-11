vim.g.mapleader = " "

-- For making it easier to move around.
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Useful when line wrapping is enabled.
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- ThePrimeagen's greatest remap ever.
vim.keymap.set("x", "<leader>pp", [["_dP]])

-- Easier time exiting NeoVim.
vim.keymap.set("n", "<leader>qq", "<Cmd>wqa<CR>")

-- Opening fugitive in a better way.
vim.keymap.set("n", "<leader>gi", "<Cmd>Git<CR><C-w>L")

-- Opening the symbol outline.
vim.keymap.set("n", "<leader>so", "<Cmd>SymbolsOutline<CR>")

-- Opening Undotree
vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle)
