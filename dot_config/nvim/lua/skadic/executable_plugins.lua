local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

	-- Colorschemes
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("projekt0n/github-nvim-theme")
	use("dracula/vim")
	use("rebelot/kanagawa.nvim")
	use("jacoborus/tender.vim")
	use("Shatur/neovim-ayu")
	use({
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup({
				style = "darker",
        code_style = {
          keywords = "bold",
        }
      })
		end,
	})
	use({ "shaunsingh/oxocarbon.nvim", run = "./install.sh" })
	use({ "Everblush/everblush.nvim", as = "everblush" })
	use("sainnhe/sonokai")

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp") -- LSP completions
	use("hrsh7th/cmp-nvim-lua") -- lua
	use({
		"Saecki/crates.nvim", -- crates
		event = { "BufRead Cargo.toml" },
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup()
		end,
	})

	-- snippets
	use({
		"L3MON4D3/LuaSnip", -- Snippets
		config = function()
			require("luasnip").config.setup({
				history = false,
			})
		end,
	}) --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	--use("williamboman/nvim-lsp-installer") -- simple to use lsp installer
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("simrat39/rust-tools.nvim") -- More capabilities for writing Rust
	use("p00f/clangd_extensions.nvim") -- More capabilities for writing C++
	use("folke/lsp-colors.nvim") -- Generate LSP highlight groups for color schemes without lsp support
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	})
	use("https://git.sr.ht/~whynothugo/lsp_lines.nvim")
  use("elkowar/yuck.vim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter", -- Better syntax highlighting
		run = ":TSUpdate",
	})
	use("p00f/nvim-ts-rainbow")

	-- Org
	--[[use({
		"nvim-neorg/neorg", -- Custom Org Mode for Nvim
		requires = { "nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope", "max397574/neorg-kanban" },
	--})]]
	use({
		"nvim-orgmode/orgmode",
		config = function()
			require("orgmode").setup_ts_grammar()
			require("orgmode").setup({
				org_agenda_files = { "~/MEGAsync/org/*" },
				org_default_notes_file = "~/Megasync/org/refile.org",
			})
		end,
	})
	use({
		"akinsho/org-bullets.nvim",
		config = function()
			require("org-bullets").setup()
		end,
	})

	-- Visual Funsies
	--use("feline-nvim/feline.nvim") -- Nice bar
	use("windwp/windline.nvim") -- Nicer bar
	--use("glepnir/dashboard-nvim") -- Dashboard when opening nvim
	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	})
	use({
		"CosmicNvim/cosmic-ui", -- Some nice windows
		requires = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("cosmic-ui").setup()
		end,
	})
	use("kyazdani42/nvim-web-devicons")
	use({
		"akinsho/bufferline.nvim",
		tag = "v2.*",
		requires = "kyazdani42/nvim-web-devicons",
	})
	use("weilbith/nvim-code-action-menu") -- A nice Code Action menu
	use("rcarriga/nvim-notify") -- Better-looking notification

	-- Extra Functionality
	use("lewis6991/gitsigns.nvim") -- Git Commands
	use({
		"kyazdani42/nvim-tree.lua", -- File Tree
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
		tag = "nightly",
	})
	use({
		"akinsho/toggleterm.nvim", -- Toggleable terminal
		tag = "v1.*",
	})
	use({
		"folke/which-key.nvim", -- Allows to see keybinds
		config = function()
			require("which-key").setup({})
		end,
	})
	use("kkoomen/vim-doge") -- Documentation Generation
	use("preservim/tagbar")

	use({
		"kosayoda/nvim-lightbulb",
		config = function()
			require("nvim-lightbulb").setup({ autocmd = { enabled = true } })
		end,
	})
	use("metakirby5/codi.vim") -- A live coding environment
	use({
		"ahmedkhalf/project.nvim", -- Project management
		config = function()
			require("project_nvim").setup({})
		end,
	})
	--[[use({
		"folke/zen-mode.nvim", -- Zen-Mode for Neorg's presenter
		config = function()
			require("zen-mode").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})]]
	use({ "michaelb/sniprun", run = "bash ./install.sh" })
	--use({
	--	"kevinhwang91/nvim-ufo",
	--	requires = "kevinhwang91/promise-async",
	--}), -- nice folding
	use("simrat39/symbols-outline.nvim")

	-- Telescope
	use("nvim-telescope/telescope.nvim") -- Search stuff
	use("nvim-telescope/telescope-media-files.nvim")

	-- Misc
	use({
		"windwp/nvim-autopairs", -- Auto-close parentheses
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use("famiu/bufdelete.nvim")
	use("dhruvasagar/vim-zoom")
	use("andweeb/presence.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
