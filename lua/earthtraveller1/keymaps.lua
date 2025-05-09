vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Just for me to be cool!
vim.keymap.set("n", "<leader>rs", "<Cmd>:.!fish<Cr>")

vim.keymap.set("n", "<leader>gi", "<Cmd>Git<Cr><C-w>L")
vim.keymap.set("n", "<leader>du", vim.cmd.UndotreeToggle)
vim.keymap.set("n", "<leader>fu", vim.cmd.NvimTreeToggle)

vim.keymap.set("n", "<A-l>", vim.cmd.tabn)
vim.keymap.set("n", "<A-h>", vim.cmd.tabp)
