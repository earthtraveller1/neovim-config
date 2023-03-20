-- This is the file that manages all of the plugins, through the package manager
-- known as Packer

vim.cmd ([[packadd packer.nvim]])

local packer = require("packer")

local function plugins(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Telescope is used as a fuzzy finder.
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- The color-scheme that I am using.
	use {
		'catppuccin/nvim', name = 'catppuccin',
		config = function() vim.cmd.colorscheme "catppuccin" end
	}

        -- Treesitter for better syntax highlighting.
        use {
            'nvim-treesitter/nvim-treesitter', name = 'nvim-treesitter',
            run = ":TSUpdate"
        }

        -- Discord Rich Presence plugin.
        use 'andweeb/presence.nvim'

        -- LSPs
        use {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v1.x',
            requires = {
                -- LSP Support
                {'neovim/nvim-lspconfig'},             -- Required
                {'williamboman/mason.nvim'},           -- Optional
                {'williamboman/mason-lspconfig.nvim'}, -- Optional

                -- Autocompletion
                {'hrsh7th/nvim-cmp'},         -- Required
                {'hrsh7th/cmp-nvim-lsp'},     -- Required
                {'hrsh7th/cmp-buffer'},       -- Optional
                {'hrsh7th/cmp-path'},         -- Optional
                {'saadparwaiz1/cmp_luasnip'}, -- Optional
                {'hrsh7th/cmp-nvim-lua'},     -- Optional

                -- Snippets
                {'L3MON4D3/LuaSnip'},             -- Required
                {'rafamadriz/friendly-snippets'}, -- Optional
            }
        }

        -- For a navigation tree
        use('nvim-tree/nvim-tree.lua')
        use('nvim-tree/nvim-web-devicons')

        -- ThePrimeagen's plugin.
        use { "ThePrimeagen/harpoon", requires = { { 'nvim-lua/plenary.nvim' }} }

        -- Tabs.
        use {'romgrk/barbar.nvim', requires = 'nvim-web-devicons'}

        -- Git integration.
        use "tpope/vim-fugitive"
end

return packer.startup(plugins)
