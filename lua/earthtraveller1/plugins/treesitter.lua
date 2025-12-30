return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    init = function()
        vim.api.nvim_create_autocmd('FileType', {
            callback = function(ev)
                local installed = require("nvim-treesitter").get_installed("parsers")
                local current_language = vim.treesitter.language.get_lang(ev.match)
                for _, language in pairs(installed) do
                    if language == current_language then
                        vim.treesitter.start()
                        break
                    end
                end
            end,
        })
    end
}
