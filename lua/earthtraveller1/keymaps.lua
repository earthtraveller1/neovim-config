vim.g.mapleader = " "

-- For making it easier to move around.
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- ThePrimeagen's greatest remap ever.
vim.keymap.set("x", "<leader>p", [["_dP]])
