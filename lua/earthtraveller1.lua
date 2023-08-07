require("earthtraveller1.settings")
require("earthtraveller1.keymaps")
require("earthtraveller1.plugins")

vim.api.nvim_create_autocmd({ "BufNew", "BufNewFile" }, {
    pattern = {"*.fs", "*.vs", "*.vert", "*.frag"},
    callback = function() vim.opt_local.filetype = "glsl" end,
})
