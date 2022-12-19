local M = {}

-- LSP and Coding-Related stuff
function M.init(use)
	use("neovim/nvim-lspconfig") -- Some LSP configs
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("folke/lsp-colors.nvim") -- Generate LSP highlight groups for color schemes without lsp support
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	})
	use("https://git.sr.ht/~whynothugo/lsp_lines.nvim")
	use({
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").setup({
				bind = true,
				handler_opts = {
					border = "rounded",
				},
			})
		end,
	})
	use({ -- Documentation Generation
		"kkoomen/vim-doge",
		run = ":call doge#install()",
		config = function()
			vim.g.doge_doc_standard_cpp = "doxygen_cpp_comment_slash"
			vim.g.doge_doc_standard_c = "doxygen_cpp_comment_slash"
		end,
	})

  -- Language-Specific
	use("simrat39/rust-tools.nvim") -- More capabilities for writing Rust
	use("p00f/clangd_extensions.nvim") -- More capabilities for writing C++
	use("alaviss/nim.nvim")
	use("vim-crystal/vim-crystal")
	use("elkowar/yuck.vim")
	use({ -- Better Markdown features
		"preservim/vim-markdown",
		requires = "godlygeek/tabular",
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter", -- Better syntax highlighting
		run = ":TSUpdate",
	})
	use("p00f/nvim-ts-rainbow")
end

return M
