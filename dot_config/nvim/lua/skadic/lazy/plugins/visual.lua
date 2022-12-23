-- Visual Funsies
return {
	{
		"windwp/windline.nvim",
		config = function()
			require("wlsample.evil_line")
		end,
	}, -- Nicer bar
	{ -- Some nice windows
		"CosmicNvim/cosmic-ui",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		config = { border_style = "rounded" },
		lazy = true,
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
	},
	{ "weilbith/nvim-code-action-menu", lazy = true, cmd = "CodeActionMenu" }, -- A nice Code Action menu
	{
		"rcarriga/nvim-notify",
		name = "notify",
		config = function()
			require("skadic.notify")
		end,
	}, -- Better-looking notification
	{ -- Actually color colorcodes #ff0000
		"norcalli/nvim-colorizer.lua",
		name = "colorizer",
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
		lazy = true,
		event = { "BufRead" },
	},
	{ "wakatime/vim-wakatime", lazy = true, event = { "BufRead" } }, -- Programming language metrics
	--[[{ -- Start screen
		"goolord/alpha-nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		name = "alpha",
		config = require("alpha.themes.startify").config,
	},]]
}
