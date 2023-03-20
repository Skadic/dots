-- Visual Funsies
return {
	{
		-- Actually color colorcodes #ff0000
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
	{
		-- Better-looking notification
		"rcarriga/nvim-notify",
		name = "notify",
		config = function()
			require("skadic.notify")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		opts = {
			space_char_blankline = " ",
			show_current_context = true,
			show_current_context_start = true,
		},
	},
}
