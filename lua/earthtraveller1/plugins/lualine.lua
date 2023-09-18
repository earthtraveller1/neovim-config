return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "linrongbin16/lsp-progress.nvim",
    },
    config = function(_, opts)
        require("lualine").setup(opts)
        -- listen lsp-progress event and refresh lualine
        vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
        vim.api.nvim_create_autocmd("User LspProgressStatusUpdated", {
            group = "lualine_augroup",
            callback = require("lualine").refresh,
        })
    end,
    opts = {
        theme = "gruvbox",
        disabled_filetypes = {
            statusline = { "NvimTree" }
        },
    }
}
