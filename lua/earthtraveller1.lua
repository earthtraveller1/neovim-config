require("earthtraveller1.settings")
require("earthtraveller1.keymaps")
require("earthtraveller1.plugins")

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = { "*.vert", "*.frag" },
    callback = function()
        vim.opt_local.filetype = "glsl"
    end,
})
