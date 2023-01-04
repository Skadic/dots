
local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end
local diagnostics = null_ls.builtins.diagnostics

null_ls.register(diagnostics.cppcheck.with({
  extra_args = function (params)
    if params.filetype == "cpp" then
      return { "--language=c++ --std=c++20" }
    else
      return { "--language=c --std=c11" }
    end
  end
}))
