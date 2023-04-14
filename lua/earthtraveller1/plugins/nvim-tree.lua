require("nvim-tree").setup()

-- Opens the tree on command.
vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeToggle)
