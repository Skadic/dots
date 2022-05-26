local caps = require("skadic.lsp.handlers").capabilities
caps.offset_encoding = "utf-8"
caps.offsetEncoding = "utf-8"

local opts = {
	server = {
		on_attach = require("skadic.lsp.handlers").on_attach,
		capabilities = caps,
	},
}

local status_ok, clangd_extensions = pcall(require, "clangd_extensions")
if status_ok then
	clangd_extensions.setup(opts)
else
	vim.notify("Clangd extensions setup failed")
end
