require('telescope').setup {
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-h>"] = "which_key"
            }
        }
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
    }
}

require('telescope').load_extension("git_worktree")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', function() builtin.find_files({ hidden = true }) end, {})
vim.keymap.set('n', '<leader>ft', function() builtin.treesitter({ hidden = true }) end, {})
vim.keymap.set('n', '<leader>fg', function() builtin.live_grep({ hidden = true }) end, {})
vim.keymap.set('n', '<leader>fb', function() builtin.buffers({ hidden = true }) end, {})
vim.keymap.set('n', '<leader>fh', function() builtin.help_tags({ hidden = true }) end, {})
