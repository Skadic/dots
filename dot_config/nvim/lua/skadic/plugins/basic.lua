local M = {}

function M.init(use)
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("lewis6991/gitsigns.nvim") -- Git Commands

	-- Telescope
	use("nvim-telescope/telescope.nvim") -- Search stuff
	use({ -- A native Sorter for telescope to increase performance
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})
	use("nvim-telescope/telescope-media-files.nvim") -- Search for media files
	use("nvim-telescope/telescope-file-browser.nvim") -- A file browser
	use("nvim-telescope/telescope-packer.nvim") -- Search through plugins
  use("gbrlsnchs/telescope-lsp-handlers.nvim") -- Better LSP Functions

	use({ -- Modify surrounding symbols
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup()
		end,
	})
	use({ -- Auto-close parentheses
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use({ -- Project management
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({})
		end,
	})
	use({ -- nice folding
		"kevinhwang91/nvim-ufo",
		requires = "kevinhwang91/promise-async",
	})
	use("famiu/bufdelete.nvim") -- Allow better deletion of buffers
end

return M
