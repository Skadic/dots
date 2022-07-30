local M = {}

local status_ok, neorg = pcall(require, "neorg")
if not status_ok then
	--vim.notify("Neorg unavailable")
	return
end



M.register_neorg_binds = function()
  local function map_neorg(mode, mapping, description)
    local prefix = "<cmd>Neorg keybind " .. mode .. " "
    return { prefix .. mapping .. "<cr>", description }
  end

  local wk = require "which-key"
  local wk_opts = { mode = "n", prefix = "<leader>", noremap = true, silent = true, buffer = 0 }

  wk.register({
    n = {
      name = "Neorg",
      t = {
        name = "Task",
        d = map_neorg("norg", "core.norg.qol.todo_items.todo.task_done", "Task Done"),
        p = map_neorg("norg", "core.norg.qol.todo_items.todo.task_pending", "Task Pending"),
        u = map_neorg("norg", "core.norg.qol.todo_items.todo.task_undone", "Task Undone"),
        h = map_neorg("norg", "core.norg.qol.todo_items.todo.task_on_hold", "Task On Hold"),
        c = map_neorg("norg", "core.norg.qol.todo_items.todo.task_cancelled", "Task Cancelled"),
      },
      -- New Note
      n = map_neorg("norg", "core.norg.dirman.new.note", "New Note"),
      -- Getting Things Done
      e = {
        name = "Getting Things Done",
        c = map_neorg("norg", "core.gtd.base.capture", "Capture Tasks"),
        v = map_neorg("norg", "core.gtd.base.views", "View Tasks"),
        f = map_neorg("norg", "core.gtd.base.edit", "Edit Tasks"),
      },
      m = {
        name = "Change Mode",
        h = {"<cmd>Neorg mode traverse-heading<CR>", "Traverse Headings"},
        n = { "<cmd>Neorg mode norg<CR>", "Norg Mode"},
      },
      ["]"] = {
        h = map_neorg("norg", "core.integrations.treesitter.next.heading", "Next Heading"),
      },
      ["["] = {
        h = map_neorg("norg", "core.integrations.treesitter.previous.heading", "Previous Heading"),
      },
      k = {"<cmd>Neorg kanban toggle<cr>", "Kanban board"},
      s = {"<cmd>Telescope neorg switch_workspace<cr>", "Switch Workspace"},
      i = {"<cmd>Telescope neorg insert_link<cr>", "Insert Link"},
      I = {"<cmd>Telescope neorg insert_file_link<cr>", "Insert File Link"},
    },
    f = {
      t = { "<cmd>Telescope neorg find_project_tasks<cr>", "Find Project Tasks"},
      a = { "<cmd>Telescope neorg find_aof_project_tasks<cr>", "Find Area of Focus Project Tasks"},
      r = { "<cmd>Telescope neorg find_linkable<cr>", "Find Linkables"},
      c = { "<cmd>Telescope neorg find_context_tasks<cr>", "Find Context Tasks"},
    }
  }, wk_opts)

end


local opts = {
	load = {
		["core.defaults"] = {},
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					work = "~/notes/work",
					gtd = "~/notes/gtd",
					journal = "~/notes/journal",
				},
			},
		},
		["core.norg.concealer"] = {},
		["core.gtd.base"] = {
			config = {
				workspace = "gtd",
			},
		},
		["core.presenter"] = {
			config = {
				zen_mode = "zen-mode",
			},
		},
    ["core.integrations.telescope"] = {},
    ["external.kanban"] = {},
    ["core.norg.journal"] = {
      config = {
        workspace = "journal",
      }
    },
    ["core.norg.qol.toc"] = {},
    ["core.integrations.nvim-cmp"] = {},
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp"
      }
    },
		["core.keybinds"] = {
			config = {
				default_keybinds = false,
				hook = function(keybinds)
          local kb_opts = { noremap = true, silent = true, buffer = 0}

          local map_no_leader = function(keys, mapping, description)
              return { keys, mapping, vim.tbl_extend("force", kb_opts, { desc = description })}
          end

					keybinds.map_event_to_mode("gtd-displays", {
						n = {
              map_no_leader("<CR>", "core.gtd.ui.goto_task", "Go to Task"),
              map_no_leader("q", "core.gtd.ui.close", "Close GTD"),
              map_no_leader("<Esc>", "core.gtd.ui.close", "Close GTD"),
              map_no_leader("e", "core.gtd.ui.edit_task", "Edit Task"),
              map_no_leader("<Tab>", "core.gtd.ui.details", "Task Details"),
						},
					}, kb_opts)

					keybinds.map_event_to_mode("presenter", {
						n = {
              map_no_leader("<CR>", "core.presenter.next_page", "Next Page"),
              map_no_leader("<Right>", "core.presenter.next_page", "Next Page"),
              map_no_leader("<Left>", "core.presenter.previous_page", "Previous Page"),
              map_no_leader("e", "core.presenter.close", "Close Presenter"),
              map_no_leader("<Esc>", "core.presenter.close", "Close Presenter"),
						},
					}, kb_opts)

				end,
			},
		},
		["core.export"] = {},
	},
}

neorg.setup(opts)

return M
