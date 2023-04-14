-- Telescope keymaps.
local telescope_builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", telescope_builtin.find_files)
vim.keymap.set("n", "<C-g>", telescope_builtin.git_files)
vim.keymap.set("n", "<leader>fg", telescope_builtin.live_grep)
vim.keymap.set("n", "<leader>ts", function()
    telescope_builtin.treesitter({ show_line = true })
end)

