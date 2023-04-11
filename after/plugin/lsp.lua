local lsp = require('lsp-zero').preset({
    name = 'recommended',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

-- Configure Python language server.
lsp.configure('pylsp', {
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    enabled = false
                }
            }
        }
    }
})

lsp.setup()

-- LSP keymaps
vim.keymap.set("n", "<leader>fb", vim.lsp.buf.format)

