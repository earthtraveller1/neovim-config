return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
        dim_inactive = {
            enabled = true,
            shade = "dark",
            percentage = 0.15,
        }
    },
    config = function(_, opts)
        require("catppuccin").setup(opts)

        vim.cmd.colorscheme("catppuccin-mocha")
    end
}
