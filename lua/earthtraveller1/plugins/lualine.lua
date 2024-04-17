return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        theme = "kanagawa",
        disabled_filetypes = {
            statusline = { "NvimTree" }
        },
    }
}
