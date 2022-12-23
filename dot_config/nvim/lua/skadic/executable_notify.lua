local status_ok, notify = pcall(require, "notify")

if not status_ok then
  vim.notify("error loading notify")
  return
end

vim.notify = notify
