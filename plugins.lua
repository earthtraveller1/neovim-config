-- This is the file that manages all of the plugins, through the package manager
-- known as Packer

vim.cmd [[packadd packer.nvim]]

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
	
end

return packer.startup(plugins)
