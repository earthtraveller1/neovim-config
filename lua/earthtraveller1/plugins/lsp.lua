local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
lspconfig.rust_analyzer.setup {}

vim.diagnostic.config {
    update_in_insert = true
}

lsp.setup()
