local M = {}

function M.init(use)
	--[[use({
		"EdenEast/nightfox.nvim",
		config = function()
			require("nightfox").setup({
				options = {
					styles = {
						keywords = "bold",
						comments = "italic",
					},
				},
				modules = {
					cmp = true,
					dashboard = true,
					lsp_trouble = true,
					diagnostic = {
						enable = true,
						background = true,
					},
					native_lsp = {
						enable = true,
						background = true,
					},
					nvimtree = true,
					telescope = true,
					whichkey = true,
					symbol_outline = true,
					gitsigns = true,
				},
			})
		end,
	})]]
	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			vim.g.catppuccin_flavour = "mocha"
			require("catppuccin").setup({
				styles = {
					comments = { "italic" },
					keywords = { "bold" },
					booleans = { "bold" },
					functions = { "bold" },
					loops = { "bold" },
				},
			})
		end,
	})
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
				},
			})
		end,
	})
	use({ "Everblush/everblush.nvim", as = "everblush" })
	use("sainnhe/sonokai")
	use("krfl/fleetish-vim")
end

return M
