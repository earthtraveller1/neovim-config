return {
    "ThePrimeagen/harpoon",
    config = function()
        local ui = require("harpoon.ui")
        local mark = require("harpoon.mark")
        vim.keymap.set("n", "<leader>ha", mark.add_file)
        vim.keymap.set("n", "<leader>hm", ui.toggle_quick_menu)

        vim.keymap.set("n", "<A-n>", ui.nav_next)
        vim.keymap.set("n", "<A-p>", ui.nav_prev)

        vim.keymap.set("n", "<A-d>", function() ui.nav_file(1) end)
        vim.keymap.set("n", "<A-f>", function() ui.nav_file(2) end)
        vim.keymap.set("n", "<A-j>", function() ui.nav_file(3) end)
        vim.keymap.set("n", "<A-k>", function() ui.nav_file(4) end)
    end
}
