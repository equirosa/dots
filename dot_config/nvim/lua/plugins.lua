return require('packer').startup(function()
	use {'wbthomason/packer.nvim', opt = true}

	-- theming
	use {'sainnhe/gruvbox-material' }
	use {'kyazdani42/nvim-web-devicons'}

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/popup.nvim','nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-frecency.nvim',
            "nvim-telescope/telescope-fzy-native.nvim"
		}
	}

	use {'neovim/nvim-lspconfig'}
	use {'preservim/nerdcommenter'}

	use {'tpope/vim-fugitive'}

	--language stuff
	use {'sheerun/vim-polyglot'}
 	-- Lua
	use {'tjdevries/nlua.nvim'}
	use {'euclidianAce/BetterLua.vim'}
end)
