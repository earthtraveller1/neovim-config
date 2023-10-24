local vault_path = os.getenv("OBSIDIAN_VAULT_PATH") or "."
return {
    "epwalsh/obsidian.nvim",
    lazy = true,
    event = { "BufReadPre " .. vault_path .. "/**.md" },
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
    -- event = { "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md" },
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",

        -- see below for full list of optional dependencies 👇
    },
    opts = {
        dir = vault_path, -- no need to call 'vim.fn.expand' here

        -- see below for full list of options 👇
    },
    config = function(_, opts)
        require("obsidian").setup(opts)
        vim.keymap.set("n", "gd", vim.cmd.ObsidianFollowLink)
    end
}
