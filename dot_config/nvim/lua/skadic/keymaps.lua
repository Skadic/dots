local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local wk_opts = { mode = "n", prefix = "<leader>", noremap = true, silent = true }

local wk = require("which-key")

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

wk.register({
  f = {
    name = "Find Files",
    f = { "<cmd>Telescope git_files<cr>", "Git Files" },
    g = { "<cmd>Telescope find_files<cr>", "Find File" },
    l = { "<cmd>Telescope live_grep<cr>", "Live Grep" }
  },
  e = { ":NvimTreeToggle<cr>", "Toggle NvimTree" },
  l = {
    name = "Language Server",
    a = { "<cmd>CodeActionMenu<cr>", "Code Action" },
    h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
    d = { "<cmd>lua vim.lsp.diagnostic.open_float()<cr>", "Show line diagnostic" },
    i = { "<cmd>lua vim.lsp.buf.implementations()<cr>", "Implementations" },
    o = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
    f = { "<cmd>lua vim.lsp.buf.formatting_sync()<cr>", "Format File" },
    r = { "<cmd>lua require('cosmic-ui').rename()<cr>", "Rename" }
  }
}, wk_opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts) -- stop nvim from yanking things when pasting over other things

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
