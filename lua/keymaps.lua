require("keymaps.barbar")
-- This file basically contains all of the keymaps that I use
-- for NeoVim.

-- Sets the leader key to be space
vim.g.mapleader = " "

-- General purpose remaps.
vim.keymap.set("n", "<leader>pv", function() vim.cmd("Ex") end)
vim.keymap.set({ "n", "i" }, "<C-u>", "<C-u>zz") -- These two are for moving.
vim.keymap.set({ "n", "i" }, "<C-d>", "<C-d>zz")

vim.keymap.set({ "n", "v" }, "<leader>y", "\"*y")
vim.keymap.set({ "n", "v" }, "<leader>p", "\"*p")

-- Telescope keymaps.
local telescope_builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", telescope_builtin.find_files)

-- Harpoon keymaps
local harpoon_ui = require("harpoon.ui")
vim.keymap.set("n", "<leader>ha", require("harpoon.mark").add_file)
vim.keymap.set("n", "<C-h>", harpoon_ui.toggle_quick_menu)
vim.keymap.set("n", "<C-m>", function() harpoon_ui.nav_file(1) end)
vim.keymap.set("n", "<C-a>", function() harpoon_ui.nav_file(2) end)
vim.keymap.set("n", "<C-z>", function() harpoon_ui.nav_file(3) end)
vim.keymap.set("n", "<C-n>", harpoon_ui.nav_next)
vim.keymap.set("n", "<C-e>", harpoon_ui.nav_prev)

-- For making the Git panel show up on the side instead of the side.
vim.api.nvim_create_user_command('Hgit', function(_)
    vim.cmd("Git")
    vim.cmd(vim.api.nvim_replace_termcodes("normal <C-w>L<C-w>20<", true, true, true))
end, {})

