return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },             -- Required

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

        lsp.on_attach(function(_, bufnr)
            -- see :help lsp-zero-keybindings
            -- to learn the available actions
            lsp.default_keymaps({ buffer = bufnr })
            vim.keymap.set('n', "<leader>fo", function() vim.lsp.buf.format() end)
            vim.keymap.set('n', "<leader>la", function() vim.lsp.buf.code_action() end)
            vim.keymap.set('n', "<leader>rn", vim.lsp.buf.rename)

            if not vim.g.vscode then
                vim.lsp.inlay_hint.enable(true)
            end
        end)

        vim.diagnostic.config({
            virtual_text = true, -- Enables inline virtual text
            signs = true,   -- Enables signs in the sign column
            update_in_insert = false, -- Don't update while typing in insert mode
            underline = true, -- Underlines problematic code
            severity_sort = true, -- Sort diagnostics by severity
        })

        lsp.setup_servers({
            'clangd',
            'gopls',
            'pylsp',
            'rust_analyzer',
            -- 'sourcekit',
            -- 'jdtls',
            'zls',
            'hls',
            'ols',
            'ts_ls',
        })

        -- (Optional) Configure lua language server for neovim
        require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
        require('lspconfig').rust_analyzer.setup {
            on_attach = function(_client, _bufnr)
                require "lsp_signature".on_attach()
            end
        }

        lsp.setup()
    end,
}
