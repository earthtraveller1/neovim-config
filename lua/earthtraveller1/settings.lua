vim.g.mapleader = " "

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.scrolloff = 14
vim.opt.wrap = false
vim.opt.cursorline = true

vim.opt.colorcolumn = "80"

vim.api.nvim_create_autocmd({ "BufRead" }, {
    pattern = { "*.md", "*.txt" },
    callback = function() vim.opt_local.wrap = true end
})
