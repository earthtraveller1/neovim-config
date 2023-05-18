vim.keymap.set("v", "<C-c>", "\"*y")
vim.keymap.set("n", "<C-a>", "ggVG$")

vim.api.nvim_create_user_command('X', 'wqa', {})
