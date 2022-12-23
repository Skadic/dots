return {
  { "nullchilly/fsread.nvim", lazy = true, cmd = { "FSClear", "FSToggle", "FSRead" }}, -- Flow State Reading
  { "metakirby5/codi.vim", lazy = true, ft = "python" }, -- A live coding environment
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
}
