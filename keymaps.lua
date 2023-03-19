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
