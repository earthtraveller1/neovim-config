require("earthtraveller1.plugins")
require("earthtraveller1.keymaps")

-- Place where all my settings go

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.autoread = true

vim.opt.scrolloff = 8

require("nvim-tree").setup()

-- Opens the file tree on startup, because why not?
vim.cmd("NvimTreeToggle")
