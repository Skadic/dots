local M = {}

function M.bg_as_hex(group)
	local col = vim.api.nvim_get_hl_by_name(group, true).background
	if col == nil then
		return nil
	end
	return string.format("#%x", col)
end
function M.fg_as_hex(group)
	local col = vim.api.nvim_get_hl_by_name(group, true).foreground
	if col == nil then
		return nil
	end
	return string.format("#%x", col)
end

local function add(name, group)
  local col = vim.api.nvim_get_hl_by_name(group, true);
  if col == nil then 
    vim.notify("highlight group " .. group .. " is empty")
  end
  M[name] = col
end

add("normal", "Normal")
add("error", "DiagnosticError")
add("warning", "DiagnosticWarning")
add("info", "DiagnosticInfo")
add("hint", "DiagnosticHint")


return M
