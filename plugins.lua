local status, packer = pcall(require, "packer") if not status then print("Packer is not installed")
	return
end

-- Reloads Neovim after whenever you save plugins.lua
vim.cmd([[
    augroup packer_user_config
      autocmd!
     autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup END
]])

packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- Treesitter
	use("nvim-treesitter/nvim-treesitter")
	use("nvim-treesitter/nvim-treesitter-context")

	-- Multiline comments
	use('preservim/nerdcommenter')

	-- auto '' "" () {} [] pairs
	use('windwp/nvim-autopairs')
	-- todo vim surround

	-- Indents blanklines
	use("lukas-reineke/indent-blankline.nvim")

	-- StatusLine
	use {
		'nvim-lualine/lualine.nvim',
  		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

	-- File management
	use('preservim/nerdtree')

	-- Icons
	use("ryanoasis/vim-devicons")
	use('nvim-tree/nvim-web-devicons')

	-- Themes
	use("EdenEast/nightfox.nvim")
	use('xiyaowong/transparent.nvim')

	-- Code Completion
	use {'neoclide/coc.nvim', branch = 'release'}

	-- TabBar
	use {
		'romgrk/barbar.nvim', requires = {
  		'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
  		'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
		}
	}

	-- Terminal
	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
	  require("toggleterm").setup()
	end}

	if packer_bootstrap then
		packer.sync()
	end
end)
 

