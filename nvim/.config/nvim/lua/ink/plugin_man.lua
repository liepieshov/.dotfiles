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

require("lazy").setup({
	-- Git related plugins
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	{
		-- Adds git releated signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	-- Detect tabstop and shiftwidth automatically
	-- don't like it;
	-- "tpope/vim-sleuth",

	{
		-- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ "j-hui/fidget.nvim", opts = {} },

			-- Additional lua configuration, makes nvim stuff amazing!
			"folke/neodev.nvim",
		},
	},

	{
		-- Autocompletion
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			{
				"L3MON4D3/LuaSnip",
				dependencies = {
					"rafamadriz/friendly-snippets",
					"honza/vim-snippets",
				},
				config = function()
					require("luasnip.loaders.from_snipmate").lazy_load()
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},
			"onsails/lspkind.nvim",
		},
	},

	-- Useful plugin to show you pending keybinds.
	-- { 'folke/which-key.nvim', opts = {} },

	{
		-- Set lualine as statusline
		"nvim-lualine/lualine.nvim",
		-- See `:help lualine.txt`
		opts = {
			options = {
				icons_enabled = false,
				component_separators = "|",
				section_separators = "",
			},
		},
	},

	-- for commenting staff
	{ "numToStr/Comment.nvim", opts = {} },
	-- Fuzzy Finder (files, lsp, etc)
	{ "nvim-telescope/telescope.nvim", version = "*", dependencies = { "nvim-lua/plenary.nvim" } },

	-- Fuzzy Finder Algorithm which requires local dependencies to be built.
	-- Only load if `make` is available. Make sure you have the system
	-- requirements installed.
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		-- NOTE: If you are having trouble with this installation,
		--       refer to the README for telescope-fzf-native for more instructions.
		build = "make",
		cond = function()
			return vim.fn.executable("make") == 1
		end,
	},

	{
		-- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		build = ":TSUpdate",
	},

	"nvim-treesitter/playground",
	-- don't know what it does
	"nvim-lua/popup.nvim",
	-- my fav null ls for python
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("null-ls").setup({
				sources = {
					require("null-ls").builtins.formatting.shfmt, -- shell script formatting
					require("null-ls").builtins.formatting.prettier, -- markdown formatting
					require("null-ls").builtins.diagnostics.shellcheck, -- shell script diagnostics
					require("null-ls").builtins.formatting.black,
					require("null-ls").builtins.formatting.isort,
					require("null-ls").builtins.formatting.stylua,
				},
			})
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	"mbbill/undotree",

	{
		"morhetz/gruvbox",
		config = function()
			vim.o.termguicolors = true
			vim.g.gruvbox_contrast_light = "soft"
			vim.g.gruvbox_italic = 1
			vim.cmd.colorscheme("gruvbox")
		end,
	},
	-- needs setting up
    {
	"theprimeagen/harpoon",
    dependencies = {'nvim-lua/plenary.nvim'}
    },
	"epwalsh/obsidian.nvim",
	-- awesome by liepieshov: New updated version 21.04.2023
}, {})
