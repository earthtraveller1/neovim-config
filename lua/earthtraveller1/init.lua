require("earthtraveller1.settings")
require("earthtraveller1.keymaps")
require("earthtraveller1.plugins")

vim.api.nvim_create_autocmd({ "BufWrite" }, {
    pattern = { "*.c", "*.rs", "*.cpp", "*.py", "*.h", "*.hpp", "*.lua" },
    callback = function()
        vim.lsp.buf.format()
    end
})
