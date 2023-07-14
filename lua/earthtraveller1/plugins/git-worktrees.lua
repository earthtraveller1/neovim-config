local telescope = require('telescope')

vim.keymap.set("n", "<leader>fw", telescope.extensions.git_worktree.git_worktrees)
vim.keymap.set("n", "<leader>cw", telescope.extensions.git_worktree.create_git_worktree)
