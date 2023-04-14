-- Harpoon keymaps
local harpoon_ui = require("harpoon.ui")
vim.keymap.set("n", "<leader>ha", require("harpoon.mark").add_file)
vim.keymap.set("n", "<C-h>", harpoon_ui.toggle_quick_menu)
vim.keymap.set("n", "<C-m>", function() harpoon_ui.nav_file(1) end)
vim.keymap.set("n", "<C-a>", function() harpoon_ui.nav_file(2) end)
vim.keymap.set("n", "<C-z>", function() harpoon_ui.nav_file(3) end)
vim.keymap.set("n", "<C-n>", harpoon_ui.nav_next)
vim.keymap.set("n", "<C-e>", harpoon_ui.nav_prev)
