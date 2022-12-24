return {
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers", -- This is the important bit!
		config = true,
    lazy = true,
    enabled = false,
    ft = "neorg",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neorg/neorg-telescope",
			"max397574/neorg-kanban",
			"max397574/neorg-contexts",
		},
	},
	{
		"nvim-orgmode/orgmode",
    lazy = true,
    ft = "org",
    enabled = false,
		config = function()
			require("orgmode").setup_ts_grammar()
			require("orgmode").setup({
				org_agenda_files = { "~/MEGAsync/org/*" },
				org_default_notes_file = "~/Megasync/org/refile.org",
			})
		end,
	},
	{
		"akinsho/org-bullets.nvim",
    lazy = true,
    ft = "org",
    enabled = false,
		config = true,
	},
}