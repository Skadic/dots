local M = {}

	-- cmp plugins
function M.init(use)
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp") -- LSP completions
	use("hrsh7th/cmp-nvim-lua") -- lua
	use({ -- crates
		"Saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup()
		end,
	})

	use({ -- Snippets
		"L3MON4D3/LuaSnip",
		config = function()
			require("luasnip").config.setup({
				history = false,
			})
		end,
	}) --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
	use({ "michaelb/sniprun", run = "bash ./install.sh" }) -- Run code snippets
end

return M
