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

local function call_if_git(command)
  local status_ok, _ = pcall(vim.cmd, command)
  if not status_ok then
    vim.notify("Not a git repo")
  end
end

wk.register({
  f = {
    name = "Search",
    g = {
      function()
        -- We want to just call the normal find files command if the current dir is not a git directory
        local status_ok, _ = pcall(vim.cmd, "Telescope git_files")
        if not status_ok then
          vim.cmd("Telescope find_files")
        end
      end,
      "Git Files"
    },
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    b = { "<cmd>Telescope buffers<cr>", "Find File" },
    p = { "<cmd>Telescope projects<cr>", "Projects" },
    l = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
    n = { "<cmd>Telescope notify<cr>", "Search Notifications" }
  },
  L = { "<cmd>Lazy<cr>", "Open Lazy"},
  e = { "<cmd>Neotree toggle<cr>", "Toggle File Tree" },
  b = { "<cmd>Neotree buffers<cr>", "Toggle Buffers" },
  s = { "<cmd>TagbarToggle<cr>", "Toggle Tagbar" },
  S = { "<cmd>SymbolsOutline<cr>", "Toggle Symbols Outline" },
  g = {
    name = "Git",
    f = {
      name = "Find",
      b = { function() call_if_git("Telescope git_branches") end, "Git Branches" },
      s = { function() call_if_git("Telescope git_status") end, "Git Status" },
      t = { function() call_if_git("Telescope git_stash") end, "Git Stashes" },
      c = { function() call_if_git("Telescope git_commits") end, "Git Commits" },
      f = { function() call_if_git("Telescope git_files") end, "Git Files" },
    },
    d = { "<cmd>Gitsigns diffthis<cr>", "Git Diff"},
    r = {
      name = "Reset",
      H = {"<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk"},
      B = {"<cmd>Gitsigns reset_buffer<cr>", "Reset Buffer"},
    },
    s = {
      name = "Stage",
      h = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk"},
      b = { "<cmd>Gitsigns stage_buffer<cr>", "Stage Buffer"},
    },
    b = { "<cmd>Gitsigns blame_line<cr>", "Blame Line"},
    t = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle Current Line Blame"},
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
