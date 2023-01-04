-- cmp plugins
return {
	{ -- The completion plugin
		"hrsh7th/nvim-cmp",
		lazy = true,
		cmd = { "BufRead" },
		config = function()
			require("skadic.cmp")
		end,
		dependencies = {
			"hrsh7th/cmp-buffer", -- buffer completions
			"hrsh7th/cmp-path", -- path completions
			"hrsh7th/cmp-cmdline", -- cmdline completions
			"davidsierradz/cmp-conventionalcommits", -- conventional commits
			{ -- snippet completions
				"saadparwaiz1/cmp_luasnip",
				lazy = true,
				dependencies = {
					{ -- Snippets
						"L3MON4D3/LuaSnip",
						name = "luasnip",
						lazy = true,
						config = function()
							require("luasnip").config.setup({
								history = false,
							})
						end,
						dependencies = {
							{ "michaelb/sniprun", build = "bash ./install.sh", lazy = true }, -- Run code snippets
							"rafamadriz/friendly-snippets", -- a bunch of snippets to use
						},
					},
				},
			},
			"hrsh7th/cmp-nvim-lsp", -- LSP completions
			"hrsh7th/cmp-nvim-lua", -- lua
		},
	},
	{ -- crates
		"Saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		dependencies = { "nvim-lua/plenary.nvim" },
		config = true,
		lazy = true,
	},
}
