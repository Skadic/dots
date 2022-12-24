return {
  { "nullchilly/fsread.nvim", lazy = true, cmd = { "FSClear", "FSToggle", "FSRead" }}, -- Flow State Reading
  { "metakirby5/codi.vim", lazy = true, ft = "python" }, -- A live coding environment
	{ "wakatime/vim-wakatime", lazy = true, event = { "BufRead" } }, -- Programming language metrics
	{ -- Discord Rich Presence
		"andweeb/presence.nvim",
    name = "presence",
		config = function()
			local presence = require("presence")
      presence:setup()
		end,
    lazy = true,
    event = { "BufRead" }
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