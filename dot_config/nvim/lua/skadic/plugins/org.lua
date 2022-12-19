local M = {}

function M.init(use)
	use({
		"nvim-neorg/neorg",
		run = ":Neorg sync-parsers", -- This is the important bit!
		config = function()
			require("neorg").setup({
				-- configuration here
			})
		end,
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-neorg/neorg-telescope",
			"max397574/neorg-kanban",
			"max397574/neorg-contexts",
		},
	})
	use({
		"nvim-orgmode/orgmode",
		config = function()
			require("orgmode").setup_ts_grammar()
			require("orgmode").setup({
				org_agenda_files = { "~/MEGAsync/org/*" },
				org_default_notes_file = "~/Megasync/org/refile.org",
			})
		end,
	})
	use({
		"akinsho/org-bullets.nvim",
		config = function()
			require("org-bullets").setup()
		end,
	})
end

return M
