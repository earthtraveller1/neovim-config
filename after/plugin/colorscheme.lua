local transparent_background = true

if jit.os == "Windows" then
    transparent_background = false
end

require("catppuccin").setup({
    flavour = "mocha",
    transparent_background = true
})

vim.cmd.colorscheme("catppuccin")

