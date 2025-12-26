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

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '*' },
  callback = function() vim.treesitter.start() end,
})

vim.diagnostic.config({
    virtual_text = true, -- Enables inline virtual text
    signs = true,   -- Enables signs in the sign column
    update_in_insert = false, -- Don't update while typing in insert mode
    underline = true, -- Underlines problematic code
    severity_sort = true, -- Sort diagnostics by severity
})

