return require("packer").startup(function()
	use("wbthomason/packer.nvim")
	use("neovim/nvim-lspconfig")
	use("glepnir/lspsaga.nvim")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/nvim-cmp")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	-- use("nvim-treesitter/playground")
	use("nvim-treesitter/nvim-treesitter-context")
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-fzy-native.nvim")
	use("tpope/vim-surround")
	use("windwp/nvim-autopairs")
	use("numToStr/Comment.nvim")
	use("ThePrimeagen/harpoon")
	use("ThePrimeagen/git-worktree.nvim")
	use("lewis6991/gitsigns.nvim")
	use("simrat39/symbols-outline.nvim")
	use("gpanders/editorconfig.nvim")
	use("akinsho/flutter-tools.nvim")
	use("junegunn/goyo.vim")
	use("arcticicestudio/nord-vim")

	-- use("tpope/vim-fugitive")
	-- use("rust-lang/rust.vim")
	-- use("darrikonn/vim-gofmt", { run = ":GoUpdateBinaries" })
	-- use("psf/black", { tag = "stable" })
	-- use("elixir-editors/vim-elixir")
	-- use("sainnhe/sonokai")
	-- use("joshdick/onedark.vim")
	-- use("gruvbox-community/gruvbox")
	-- use("luisiacc/gruvbox-baby")
	-- use("nvim-lualine/lualine.nvim")
	-- use("itchyny/lightline.vim")
end)
