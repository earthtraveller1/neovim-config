-- This file basically contains all of the keymaps that I use
-- for NeoVim.

-- Sets the leader key to be space
vim.g.mapleader = " "

-- General purpose remaps.
vim.keymap.set("n", "<leader>pv", function() vim.cmd("Ex") end)
vim.keymap.set({ "n", "i" }, "<C-u>", "<C-u>zz") -- These two are for moving.
vim.keymap.set({ "n", "i" }, "<C-d>", "<C-d>zz")

vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y")
vim.keymap.set({ "n", "v" }, "<leader>p", "\"+p")

-- For making the Git panel show up on the side instead of above.
vim.api.nvim_create_user_command('Hgit', function(_)
    vim.cmd("Git")
    vim.cmd(vim.api.nvim_replace_termcodes("normal <C-w>L<C-w>20<", true, true, true))
end, {})

-- Opens an integrated terminal
vim.api.nvim_create_user_command("Term", function(_)
    vim.cmd(vim.api.nvim_replace_termcodes("normal <C-w>s<C-w>10+<C-w>j", true, true, true))
    if jit.os == "Windows" then
        vim.cmd.terminal("pwsh")
    end

    if jit.os == "Linux" then
        vim.cmd.terminal("bash")
    end
end, {})
