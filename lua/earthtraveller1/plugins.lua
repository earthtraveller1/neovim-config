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
        "catppuccin/nvim",
        name = "catppuccin",
        config = {
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            background = {
                -- :h background
                light = "latte",
                dark = "mocha",
            },
            transparent_background = true,
            show_end_of_buffer = false, -- show the '~' characters after the end of buffers
            term_colors = false,
            dim_inactive = {
                enabled = false,
                shade = "dark",
                percentage = 0.15,
            },
            no_italic = false, -- Force no italic
            no_bold = false,   -- Force no bold
            styles = {
                comments = { "italic" },
                conditionals = { "italic" },
                loops = {},
                functions = {},
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
            },
            color_overrides = {},
            custom_highlights = {},
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                telescope = true,
                notify = false,
                mini = false,
                -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
            },
        }
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
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    'tpope/vim-fugitive',
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {
                    statusline = { "NvimTree", "fugitive" },
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { 'filename' },
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
    },
    {
        'romgrk/barbar.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            -- WARN: do not copy everything below into your config!
            --       It is just an example of what configuration options there are.
            --       The defaults are suitable for most people.

            -- Enable/disable animations
            animation = true,
            -- Enable/disable auto-hiding the tab bar when there is a single buffer
            auto_hide = true,
            -- Enable/disable current/total tabpages indicator (top right corner)
            tabpages = true,
            -- Enables/disable clickable tabs
            --  - left-click: go to buffer
            --  - middle-click: delete buffer
            clickable = true,
            -- Excludes buffers from the tabline
            -- exclude_ft = { 'javascript' },
            -- exclude_name = { 'package.json' },
            -- A buffer to this direction will be focused (if it exists) when closing the current buffer.
            -- Valid options are 'left' (the default) and 'right'
            focus_on_close = 'left',
            -- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
            hide = { extensions = false, inactive = false },
            -- Disable highlighting alternate buffers
            highlight_alternate = false,
            -- Disable highlighting file icons in inactive buffers
            highlight_inactive_file_icons = false,
            -- Enable highlighting visible buffers
            highlight_visible = true,
            icons = {
                -- Configure the base icons on the bufferline.
                buffer_index = true,
                buffer_number = false,
                button = '',
                -- Enables / disables diagnostic symbols
                diagnostics = {
                    [vim.diagnostic.severity.ERROR] = { enabled = true, icon = 'ﬀ' },
                    [vim.diagnostic.severity.WARN] = { enabled = false },
                    [vim.diagnostic.severity.INFO] = { enabled = false },
                    [vim.diagnostic.severity.HINT] = { enabled = true },
                },
                filetype = {
                    -- Sets the icon's highlight group.
                    -- If false, will use nvim-web-devicons colors
                    custom_colors = false,
                    -- Requires `nvim-web-devicons` if `true`
                    enabled = true,
                },
                separator = { left = '▎', right = '' },
                -- Configure the icons on the bufferline when modified or pinned.
                -- Supports all the base icon options.
                modified = { button = '●' },
                pinned = { button = '車', filename = true, separator = { right = '' } },
                -- Configure the icons on the bufferline based on the visibility of a buffer.
                -- Supports all the base icon options, plus `modified` and `pinned`.
                alternate = { filetype = { enabled = true } },
                current = { buffer_index = true },
                inactive = { button = '×' },
                visible = { modified = { buffer_number = true } },
            },
            -- If true, new buffers will be inserted at the start/end of the list.
            -- Default is to insert after current buffer.
            insert_at_end = true,
            insert_at_start = false,
            -- Sets the maximum padding width with which to surround each tab
            maximum_padding = 1,
            -- Sets the minimum padding width with which to surround each tab
            minimum_padding = 8,
            -- Sets the maximum buffer name length.
            maximum_length = 30,
            -- If set, the letters for each buffer in buffer-pick mode will be
            -- assigned based on their name. Otherwise or in case all letters are
            -- already assigned, the behavior is to assign letters in order of
            -- usability (see order below)
            semantic_letters = true,
            -- Set the filetypes which barbar will offset itself for
            sidebar_filetypes = {
                -- Use the default values: {event = 'BufWinLeave', text = nil}
                NvimTree = true,
                -- Or, specify the text used for the offset:
                undotree = { text = 'undotree' },
                -- Or, specify the event which the sidebar executes when leaving:
                ['neo-tree'] = { event = 'BufWipeout' },
                -- Or, specify both
                Outline = { event = 'BufWinLeave', text = 'symbols-outline' },
            },
            -- New buffer letters are assigned in this order. This order is
            -- optimal for the qwerty keyboard layout but might need adjustment
            -- for other layouts.
            letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
            -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
            -- where X is the buffer number. But only a static string is accepted here.
            no_name_title = nil,
        },
    },
    'nvim-tree/nvim-tree.lua',
    {
        'ggandor/leap.nvim',
        dependencies = { 'tpope/vim-repeat' },
        init = function()
            require("leap").add_default_mappings()
        end
    },
    'nvim-treesitter/playground',
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'simrat39/symbols-outline.nvim',
    "ThePrimeagen/vim-be-good",
    "folke/trouble.nvim",
})

require("earthtraveller1.plugins.lsp")
require("earthtraveller1.plugins.telescope")
require("earthtraveller1.plugins.barbar")
require("earthtraveller1.plugins.nvim-tree")
require("earthtraveller1.plugins.debugger")
require("earthtraveller1.plugins.trouble")
require("earthtraveller1.plugins.treesitter")

