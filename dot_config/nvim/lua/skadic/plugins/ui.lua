local M = {}

function M.init(use)
	use({ -- File Tree
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
		tag = "nightly",
	})
	use({ -- Toggleable terminal
		"akinsho/toggleterm.nvim",
		tag = "*",
	})
	use({ -- Allows to see keybinds
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	})
	use("simrat39/symbols-outline.nvim") -- A toggleable symbols outpline
	use("preservim/tagbar") -- A little like Symbols outline but simpler
	use({ -- Add the vscode lightbulb to the sidebar
		"kosayoda/nvim-lightbulb",
		config = function()
			require("nvim-lightbulb").setup({ autocmd = { enabled = true } })
		end,
	})
	use({ -- Zen-Mode for Neorg's presenter
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup()
		end,
	})
end

return M
