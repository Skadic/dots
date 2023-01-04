return {
	{ -- Start screen
		"goolord/alpha-nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		name = "alpha",
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			{ -- Allows you to puck windows
				"s1n7ax/nvim-window-picker",
				config = {
					autoselect_one = true,
					include_current = false,
					filter_rules = {
						-- filter using buffer options
						bo = {
							-- if the file type is one of following, the window will be ignored
							filetype = { "neo-tree", "neo-tree-popup", "notify" },
							-- if the buffer type is one of following, the window will be ignored
							buftype = { "terminal", "quickfix" },
						},
					},
				},
				lazy = true,
			},
		},
		lazy = true,
		cmd = "Neotree",
		event = "BufEnter isdirectory(expand('%:p'))",
		config = require("skadic.neo-tree"),
	},
	{ -- Nice statusbar
		"feline-nvim/feline.nvim",
		name = "feline",
		dependencies = {
			{
				"SmiteshP/nvim-navic",
				dependencies = { "neovim/nvim-lspconfig" },
				config = function()
					require("nvim-navic").setup(require("skadic.navic"))
				end,
			},
		},
		config = function()
			require("feline").setup(require("skadic.feline_conf").bar)
			require("feline").winbar.setup(require("skadic.feline_conf").winbar)
		end,
	},
	{ -- Toggleable terminal
		"akinsho/toggleterm.nvim",
		lazy = true,
		keys = "<C-p>",
		config = {
			open_mapping = [[<c-p>]],
		},
	},
	{ -- Allows to see keybinds
		"folke/which-key.nvim",
		config = true,
		lazy = true,
	},

	--- LSP-Related UI ---
	{ -- A toggleable symbols outline
		"simrat39/symbols-outline.nvim",
		lazy = true,
		cmd = { "SymbolsOutline", "SymbolsOutlineOpen" },
		config = { autofold_depth = 2 },
	},
	{ "preservim/tagbar", lazy = true, cmd = { "Tagbar", "TagbarToggle" } }, -- A little like Symbols outline but simpler
	{ -- Some nice windows
		"CosmicNvim/cosmic-ui",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		config = { border_style = "rounded" },
		lazy = true,
	},
	{ -- Debugger UI
		"rcarriga/nvim-dap-ui",
		lazy = true,
		event = "LspAttach",
		dependencies = { "mfussenegger/nvim-dap" },
	},
	{ "weilbith/nvim-code-action-menu", lazy = true, cmd = "CodeActionMenu" }, -- A nice Code Action menu
	{
		"folke/trouble.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = true,
		lazy = true,
		event = "LspAttach",
	},
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("lspsaga").init_lsp_saga({
				border_style = "rounded",
			})
		end,
    lazy = true,
    cmd = "Lspsaga",
    event = "LspAttach"
	},
}
