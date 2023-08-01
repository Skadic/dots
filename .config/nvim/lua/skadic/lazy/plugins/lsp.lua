-- LSP and Coding-Related stuff
return {
  -- Mason
  {
    -- Allow installing tools like LSP Servers, Linters etc
    "williamboman/mason.nvim",
    lazy = true,
    cmd = "Mason",
    event = { "BufRead" },
    opts = require("skadic.lsp.mason"),
  },
  {
    -- for formatters and linters
    "jose-elias-alvarez/null-ls.nvim",
    lazy = true,
    config = function()
      require("skadic.lsp.null-ls")
    end,
    event = "BufRead",
  },
  {
    -- Lsp Configuration for mason
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("skadic.lsp.mason-lspconfig")
    end,
    dependencies = {
      "neovim/nvim-lspconfig", -- Some LSP configs
      "williamboman/mason.nvim",
    },
    lazy = true,
    event = "BufRead",
  },

  {
    -- Debugging
    "mfussenegger/nvim-dap",
    lazy = true,
    event = "LspAttach",
    config = function()
      require("skadic.dap.init")
    end,
  },
  {
    -- Generate LSP highlight groups for color schemes without lsp support
    "folke/lsp-colors.nvim",
    lazy = true,
    event = "LspAttach",
  },
  {
    -- Help with function signatures
    "ray-x/lsp_signature.nvim",
    name = "lsp_signature",
    opts = {
      bind = true,
      handler_opts = {
        border = "rounded",
      },
    },
    lazy = true,
    event = "LspAttach",
  },
  {
    -- Documentation Generation
    "kkoomen/vim-doge",
    build = function()
      vim.cmd("call doge#install()")
    end,
    config = function()
      vim.g.doge_doc_standard_cpp = "doxygen_cpp_comment_slash"
      vim.g.doge_doc_standard_c = "doxygen_cpp_comment_slash"
    end,
    lazy = false,
    cmd = "DogeGenerate",
  },

  -- Language-Specific
  {
    -- More capabilities for writing Rust
    "simrat39/rust-tools.nvim",
    lazy = true,
    ft = "rust",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "SmiteshP/nvim-navic",
    },
    config = function()
      require("skadic.lsp.settings.rust_analyzer")
    end,
  },
  {
    -- More capabilities for writing C++
    "p00f/clangd_extensions.nvim",
    lazy = true,
    ft = { "cpp", "hpp", "c", "h" },
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "alepez/vim-gtest",
      "SmiteshP/nvim-navic",
    },
    opts = require("skadic.lsp.settings.clangd"),
  },
  { "alaviss/nim.nvim",        lazy = true, ft = "nim",     dependencies = { "williamboman/mason-lspconfig.nvim" } },
  { "vim-crystal/vim-crystal", lazy = true, ft = "crystal", dependencies = { "williamboman/mason-lspconfig.nvim" } },
  { "elkowar/yuck.vim",        lazy = true, ft = "yuck" },
  {
    "adelarsq/neofsharp.vim",
    lazy = true,
    ft = "fsharp",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
  },
  {
    "kaarmu/typst.vim",
    ft = "typst",
    lazy = false,
  },
  {
    -- Better Markdown features
    "preservim/vim-markdown",
    dependencies = { "godlygeek/tabular" },
    lazy = true,
    ft = "markdown",
  },
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      local palette = require("skadic.colors").palette
      palette.normal_bg = palette.bg
      palette.title_bg = palette.black
      require("lspsaga").setup({
        ui = {
          theme = "round",
          border = "rounded",
          colors = palette,
        },
      })
    end,
    lazy = true,
    cmd = "Lspsaga",
    event = "LspAttach",
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "rouge8/neotest-rust",
    },
    config = function()
      require("skadic.neotest")
    end,
    lazy = true,
    ft = { "rust" },
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
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
      },
    },
  },
}
