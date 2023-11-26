return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "linrongbin16/lsp-progress.nvim",
    },
    opts = {
        theme = "kanagawa",
        disabled_filetypes = {
            statusline = { "NvimTree" }
        },
    }
}
