return require('packer').startup(function()
	use {'wbthomason/packer.nvim', opt = true}

	-- theming
	use {
		'sainnhe/gruvbox-material','kyazdani42/nvim-web-devicons'
	}

	-- Git
	use {
		'tpope/vim-fugitive',
		{'lewis6991/gitsigns.nvim',	requires = {'nvim-lua/plenary.nvim'}}
	}

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/popup.nvim','nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-frecency.nvim',
            "nvim-telescope/telescope-fzy-native.nvim"
		}
	}

	-- LSP
	use {
		'neovim/nvim-lspconfig','onsails/lspkind-nvim',
		'glepnir/lspsaga.nvim',
		{
			'mhartington/formatter.nvim',
			opt = true, cmd = 'Format',
			requires = {'andrejlevkovitch/vim-lua-format'}
		}
	}
	use {'preservim/nerdcommenter'}

	--language stuff
	use {'sheerun/vim-polyglot'}
 	-- Lua
	use {'tjdevries/nlua.nvim'}
	use {'euclidianAce/BetterLua.vim'}

	--use {
		--'glepnir/galaxyline.nvim',
		--branch = 'main',
		--config = function() require'my_statusline' end,
		--requires = {'kyazdani42/nvim-web-devicons', opt = true}
	--}
end)
