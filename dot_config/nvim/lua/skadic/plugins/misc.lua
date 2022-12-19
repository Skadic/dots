local M = {}

function M.init(use)
	use("nullchilly/fsread.nvim") -- Flow State Reading
	use("metakirby5/codi.vim") -- A live coding environment
	use({ -- Discord Rich Presence
		"andweeb/presence.nvim",
		config = function()
			require("presence").setup({})
		end,
	})
end

return M
