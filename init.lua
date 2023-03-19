require("plugins")
require("keymaps")

-- Place where all my settings go

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true

-- Treesitter settings
require("nvim-treesitter.configs").setup({
    ensure_installed = {'rust', 'cpp', 'typescript', 'javascript', 'lua'},
    auto_install = false,
    highlight = { enable = true },
})
