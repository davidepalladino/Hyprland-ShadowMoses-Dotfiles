local plugins = {
	{'folke/tokyonight.nvim'},
	{'nvim-lualine/lualine.nvim'},
	{'goolord/alpha-nvim'},
	{
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
	{'nvim-telescope/telescope-fzf-native.nvim'},
	{'kyazdani42/nvim-tree.lua'},
    {'nvim-tree/nvim-web-devicons'},
	{
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },
	{"karb94/neoscroll.nvim"},
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
		    {'neovim/nvim-lspconfig'},             -- Required
		    {                                      -- Optional
				'williamboman/mason.nvim',
				build = function()
		          pcall(vim.cmd, 'MasonUpdate')
		        end,
		    },
		    {'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},					-- Required
			{'hrsh7th/cmp-nvim-lsp'},				-- Required
			{'hrsh7th/cmp-nvim-lsp-signature-help'}, -- Optional
			{'hrsh7th/cmp-buffer'},					-- Optional
			{'hrsh7th/cmp-path'},					-- Optional
			{'saadparwaiz1/cmp_luasnip'},			-- Optional
			{'hrsh7th/cmp-nvim-lua'},				-- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
	},
	{'folke/neodev.nvim'},
	{
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function() require "lsp_signature".on_attach() end,
    },
	{'nvim-treesitter/nvim-treesitter', cmd = 'TSUpdate'},
	{"windwp/nvim-ts-autotag"},
	{"numToStr/Comment.nvim"},
	{
        'christoomey/vim-tmux-navigator',
        lazy = false
    },
	{'ziontee113/color-picker.nvim'}
}

local opts = {}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins, opts)
