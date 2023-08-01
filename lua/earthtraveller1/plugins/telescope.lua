return {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim', 'ThePrimeagen/git-worktree.nvim' },
    opts = {},
    config = function(_, opts)
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', function() builtin.find_files({ hidden = true }) end, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

        local telescope = require("telescope")
        telescope.setup(opts)
        telescope.load_extension("git_worktree")

        vim.keymap.set('n', '<leader>fw', telescope.extensions.git_worktree.git_worktrees, {})
        vim.keymap.set('n', '<leader>cw', telescope.extensions.git_worktree.create_git_worktree, {})

        vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {})

    end
}
