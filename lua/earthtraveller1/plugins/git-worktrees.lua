local telescope = require('telescope')

vim.keymap.set("n", "<leader>fw", telescope.extensions.git_worktrees.git_worktrees)
vim.keymap.set("n", "<leader>cw", telescope.extensions.git_worktrees.git_worktrees)
