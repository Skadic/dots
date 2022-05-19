local opts = {
	server = {
		on_attach = require("skadic.lsp.handlers").on_attach,
		capabilities = require("skadic.lsp.handlers").capabilities,
	},
}

local status_ok, clangd_extensions = pcall(require, "clangd_extensions")
if status_ok then
	clangd_extensions.setup(opts)
else
	vim.notify("Clangd extensions setup failed")
end
