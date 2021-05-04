return require('packer').startup(function()
	use {'wbthomason/packer.nvim', opt = true}

	use {'sainnhe/gruvbox-material' }

	use {
		'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/popup.nvim'},{'nvim-lua/plenary.nvim'}}
	}

	use {'neovim/nvim-lspconfig'}
	use {'nvim-lua/completion-nvim'}

	use {'tpope/vim-fugitive'}

	--language stuff
--	use {'LnL7/vim-nix', ft = 'nix'} -- Nix
 	-- Lua
	use {'tjdevries/nlua.nvim'}
	use {'euclidianAce/BetterLua.vim'}
end)
