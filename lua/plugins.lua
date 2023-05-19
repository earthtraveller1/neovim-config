-- This contains all of the plugins and their configurations. Sorry that I had to put them all into a single place.

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            sidebar_filetypes = {
                NvimTree = true
            }
        },
        version = '^1.0.0', -- optional: only update when a new 1.x version is released
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function(_, opts) require("nvim-treesitter.configs").setup(opts) end,
        opts = {
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python" },
            auto_install = true,
            highlight = {
                enable = true
            }
        }
    },

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {}
    },

    {
        "nvim-tree/nvim-tree.lua",
        opts = {},
        config = function(_, opts)
            require("nvim-tree").setup(opts)

            -- Open up the file tree on open.
            vim.cmd("NvimTreeOpen")
        end
    },

    { "nvim-lualine/lualine.nvim", opts = { options = { disabled_filetypes = { status_line = { "NvimTree" } } } } },
    { "m4xshen/autoclose.nvim",    opts = { options = { disabled_filetypes = { "text", "markdown" } } } }
})
