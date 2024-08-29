return {
    "mfussenegger/nvim-jdtls",
    opts = {
        cmd = { 'jdtls' },
        root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
    },
    config = function(_, opts)
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "java",
            callback = function()
                require('jdtls').start_or_attach(opts)
            end
        })
    end
}
