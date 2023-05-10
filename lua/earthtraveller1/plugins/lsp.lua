local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

lsp.ensure_installed({
    'lua_ls',
    'clangd',
    'rust_analyzer',
    'pylsp'
})

lsp.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})

local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
lspconfig.rust_analyzer.setup {}
lspconfig.clangd.setup {
    settings = {
        clangd = {
            arguments = {
                "--clang-tidy"
            }
        }
    }
}
lspconfig.pylsp.setup {
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    enabled = false
                }
            }
        }
    }
}

require "lsp_signature".setup({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
        border = "rounded"
    }
})

vim.diagnostic.config {
    update_in_insert = true
}

lsp.setup()
