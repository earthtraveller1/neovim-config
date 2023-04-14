require("earthtraveller1.plugins")
require("earthtraveller1.keymaps")

require("earthtraveller1.plugins.leap")
require("earthtraveller1.plugins.presence")
require("earthtraveller1.plugins.debugger")
require("earthtraveller1.plugins.lsp")
require("earthtraveller1.plugins.colorscheme")
require("earthtraveller1.plugins.treesitter")
require("earthtraveller1.plugins.barbar")
require("earthtraveller1.plugins.lualine")
require("earthtraveller1.plugins.telescope")
require("earthtraveller1.plugins.nvim-tree")
require("earthtraveller1.plugins.harpoon")

-- Place where all my settings go

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.autoread = true

vim.opt.scrolloff = 8

-- This has to be here for some reasons.
-- Make it so that the tabs are offset
vim.api.nvim_create_autocmd('FileType', {
    callback = function(tbl)
        local set_offset = require('bufferline.api').set_offset

        local bufwinid
        local last_width
        local autocmd = vim.api.nvim_create_autocmd('WinScrolled', {
            callback = function()
                bufwinid = bufwinid or vim.fn.bufwinid(tbl.buf)

                local width = vim.api.nvim_win_get_width(bufwinid)
                if width ~= last_width then
                    set_offset(width, 'FileTree')
                    last_width = width
                end
            end,
        })

        vim.api.nvim_create_autocmd('BufWipeout', {
            buffer = tbl.buf,
            callback = function()
                vim.api.nvim_del_autocmd(autocmd)
                set_offset(0)
            end,
            once = true,
        })
    end,
    pattern = 'NvimTree',     -- or any other filetree's `ft`
})
