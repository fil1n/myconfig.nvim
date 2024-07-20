local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable',
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.6',
		dependencies = { 'nvim-lua/plenary.nvim' },
	},
	{
		'ThePrimeagen/harpoon',
		branch = 'harpoon2',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			local harpoon = require('harpoon')
			harpoon:setup()
		end,
	},
	{
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require('nvim-treesitter.configs').setup({
				ensure_installed = {
					'c',
					'python',
					'lua',
					'vim',
					'vimdoc',
					'nix',
				},

				sync_install = false,
				auto_install = true,

				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
			})
		end,
	},
	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end,
	},
	{
		'kylechui/nvim-surround',
		version = '*',
		event = 'VeryLazy',
		config = function()
			require('nvim-surround').setup({})
		end,
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require('lualine').setup({
				options = {
					theme = 'modus-vivendi',
					icons_enabled = false,
					component_separators = { left = '', right = '' },
					section_separators = { left = '', right = '' },
				},
			})
		end,
	},
	{
		'folke/todo-comments.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		opts = {
			signs = false,
		},
	},
	{
		'nvim-tree/nvim-tree.lua',
		version = '*',
		lazy = false,
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
		config = function()
			require('nvim-tree').setup({})
		end,
	},
	{
		'tpope/vim-fugitive',
	},
	{
		'lukas-reineke/indent-blankline.nvim',
		main = 'ibl',
		opts = {},
		config = function()
			require('ibl').setup()
		end,
	},
	{
		'scottmckendry/cyberdream.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			pcall(vim.cmd, 'colo cyberdream')
		end,
	},
	{
		'neovim/nvim-lspconfig',
		lazy = false,
		config = function()
			require('lspconfig').ruff_lsp.setup({
				init_options = {
					settings = {
						args = {},
					},
				},
			})
		end,
	},
	{
		'echasnovski/mini.completion',
		version = '*',
		config = function()
			require('mini.completion').setup()
		end,
	},
})
