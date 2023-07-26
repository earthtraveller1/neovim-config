return {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
    config = function(_, opts)
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', function() builtin.find_files({ hidden = true }) end, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

        require("telescope").setup(opts)
    end
}
