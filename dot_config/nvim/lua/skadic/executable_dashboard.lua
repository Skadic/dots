local home = os.getenv('HOME')
local status_ok, db = pcall(require, "dashboard")

if not status_ok then
	--vim.notify("Dashboard unavailable")
	return
end

vim.g.dashboard_default_executive = "telescope"

db.preview_command = "lolcat -b -f -r -h 0.2 -v 0.3"
db.preview_file_path = home .. "/.config/nvim/lua/skadic/static/escher1.txt"
db.preview_file_height = 18
db.preview_file_width = 56
db.custom_center = {
	{
		icon = "  ",
		desc = "Recently latest session",
		action = "SessionLoad",
	},
	{
		icon = "  ",
		desc = "Find File",
		action = "Telescope find_files",
	},
	{
    icon = "  ",
		desc = "Open Org",
		action = "NeorgStart",
	},
	{
		icon = "  ",
		desc = "Open Configuration",
		action = "",
	},
	{
		icon = "  ",
		desc = "Open Project",
		action = "Telescope projects",
	},
}
