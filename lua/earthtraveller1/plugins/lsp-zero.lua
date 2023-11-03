return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },             -- Required
        { 'williamboman/mason.nvim' },           -- Optional
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },     -- Required
        { 'hrsh7th/cmp-nvim-lsp' }, -- Required
        { 'L3MON4D3/LuaSnip' },     -- Required
    },
    config = function()
        local lsp = require('lsp-zero').preset({
            manage_nvim_cmp = {
                set_extra_mappings = true,
            }
        })

        lsp.ensure_installed({
            "lua_ls"
        })

        lsp.on_attach(function(_, bufnr)
            -- see :help lsp-zero-keybindings
            -- to learn the available actions
            lsp.default_keymaps({ buffer = bufnr })
        end)

        lsp.setup_servers({
            'clangd', 'ocamllsp', 'rust_analyzer', 'pylsp', 'gopls', 'zls', 'sourcekit'
        })

        -- (Optional) Configure lua language server for neovim
        require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

        lsp.setup()

        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
                virtual_text = true,
                signs = true,
                underline = true,
                update_in_insert = true,
            }
        )
    end,
}
