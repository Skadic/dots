-- LSP and Coding-Related stuff
return {
  -- Mason
	{ -- Allow installing tools like LSP Servers, Linters etc
		"williamboman/mason.nvim",
		lazy = true,
		cmd = "Mason",
		event = { "BufRead" },
		config = require("skadic.lsp.mason"),
	},
	{ -- for formatters and linters
		"jose-elias-alvarez/null-ls.nvim",
		lazy = true,
    config = function ()
      require("skadic.lsp.null-ls")
    end,
    event = "BufRead"
	},
	{ -- Lsp Configuration for mason
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("skadic.lsp.mason-lspconfig")
		end,
		dependencies = {
			"neovim/nvim-lspconfig", -- Some LSP configs
			"williamboman/mason.nvim",
		},
    lazy = true,
	},

	{
		"mfussenegger/nvim-dap",
		lazy = true,
		event = "LspAttach",
		config = function()
			require("skadic.dap")
		end,
	},
	{ "rcarriga/nvim-dap-ui", lazy = true, event = "LspAttach", dependencies = { "mfussenegger/nvim-dap" } },
	{ "folke/lsp-colors.nvim", lazy = true, event = "LspAttach" }, -- Generate LSP highlight groups for color schemes without lsp support
	{
		"folke/trouble.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = true,
		lazy = true,
		event = "LspAttach",
	},
	{ url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim", lazy = true, config = true }, -- Show diagnostics below lines
	{ -- Help with function signatures
		"ray-x/lsp_signature.nvim",
		name = "lsp_signature",
		config = {
			bind = true,
			handler_opts = {
				border = "rounded",
			},
		},
		lazy = true,
		event = "LspAttach",
	},
	{ -- Documentation Generation
		"kkoomen/vim-doge",
		build = function()
			vim.cmd("call doge#install()")
		end,
		config = function()
			vim.g.doge_doc_standard_cpp = "doxygen_cpp_comment_slash"
			vim.g.doge_doc_standard_c = "doxygen_cpp_comment_slash"
		end,
		lazy = true,
		cmd = "DogeGenerate",
	},

	-- Language-Specific
	{ "simrat39/rust-tools.nvim", lazy = true, ft = "rust", dependencies = { "williamboman/mason-lspconfig.nvim" } }, -- More capabilities for writing Rust
	{ -- More capabilities for writing C++
		"p00f/clangd_extensions.nvim",
		lazy = true,
		ft = { "cpp", "hpp", "c", "h" },
		dependencies = { "williamboman/mason-lspconfig.nvim" },
	},
	{ "alaviss/nim.nvim", lazy = true, ft = "nim", dependencies = { "williamboman/mason-lspconfig.nvim" } },
	{ "vim-crystal/vim-crystal", lazy = true, ft = "crystal", dependencies = { "williamboman/mason-lspconfig.nvim" } },
	{ "elkowar/yuck.vim", lazy = true, ft = "yuck" },
	{ -- Better Markdown features
		"preservim/vim-markdown",
		dependencies = { "godlygeek/tabular" },
		lazy = true,
		ft = "markdown",
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter", -- Better syntax highlighting
		build = ":TSUpdate",
		lazy = true,
		event = "BufRead",
		config = function()
			require("skadic.treesitter")
		end,
		dependencies = {
			"p00f/nvim-ts-rainbow",
		},
	},
}
