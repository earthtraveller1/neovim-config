-- Set up lazy.nvimbar
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
    },

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim',          build = vim.cmd.MasonUpdate },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
            { 'ray-x/lsp_signature.nvim' },
        }
    },

    { "catppuccin/nvim", name = "catppuccin" },
    { 'nvim-telescope/telescope.nvim', tag = '0.1.1', dependencies = { 'nvim-lua/plenary.nvim' } },
    { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
    { 'romgrk/barbar.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
    { 'ggandor/leap.nvim', dependencies = { 'tpope/vim-repeat' } },

    'nvim-tree/nvim-tree.lua',
    'tpope/vim-fugitive',
    'nvim-treesitter/playground',
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'simrat39/symbols-outline.nvim',
    "ThePrimeagen/vim-be-good",
    "folke/trouble.nvim",
    "andweeb/presence.nvim",
    "m4xshen/autoclose.nvim",
})

require("earthtraveller1.plugins.barbar")
require("earthtraveller1.plugins.catppuccin")
require("earthtraveller1.plugins.debugger")
require("earthtraveller1.plugins.lsp")
require("earthtraveller1.plugins.lualine")
require("earthtraveller1.plugins.nvim-tree")
require("earthtraveller1.plugins.telescope")
require("earthtraveller1.plugins.treesitter")
require("earthtraveller1.plugins.trouble")
require("earthtraveller1.plugins.presence")

require("leap").add_default_mappings()
require("autoclose").setup()
require("symbols-outline").setup()
