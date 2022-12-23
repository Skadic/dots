return {
	{ -- File Tree
		"kyazdani42/nvim-tree.lua",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("skadic.nvim-tree")
		end,
    lazy = true,
    event = "BufEnter",
    cmd = "NvimTreeToggle"
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
	{
		"simrat39/symbols-outline.nvim",
		lazy = true,
		cmd = { "SymbolsOutline", "SymbolsOutlineOpen" },
		config = { autofold_depth = 2 },
	}, -- A toggleable symbols outpline
	{ "preservim/tagbar", lazy = true, cmd = { "Tagbar", "TagbarToggle" } }, -- A little like Symbols outline but simpler
	{ -- Add the vscode lightbulb to the sidebar
		"kosayoda/nvim-lightbulb",
		config = function()
			require("nvim-lightbulb").setup({ autocmd = { enabled = true } })
		end,
    lazy = true,
    event = "LspAttach"
	},
	{ -- Zen-Mode for Neorg's presenter
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup()
		end,
    lazy = true,
    cmd = "ZenMode"
	},
}
