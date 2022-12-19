local M = {}

-- Visual Funsies
function M.init(use)
	use("windwp/windline.nvim") -- Nicer bar
	use({ -- Start screen
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	})
	use({ -- Some nice windows
		"CosmicNvim/cosmic-ui",
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
	use({ -- Actually color colorcodes #ff0000
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				"*",
				html = {
					names = true,
					css = true,
				},
				css = {
					names = true,
					css = true,
				},
			}, {
				names = false,
				mode = "foreground",
			})
		end,
	})
	use("wakatime/vim-wakatime") -- Programming language metrics
end

return M
