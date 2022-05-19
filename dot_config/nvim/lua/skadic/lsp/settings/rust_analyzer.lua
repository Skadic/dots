local status_ok, rust_tools = pcall(require, "rust-tools")
if not status_ok then
	vim.notify("Rust tools setup failed")
end

local opts = {
	server = {
		on_attach = require("skadic.lsp.handlers").on_attach,
		capabilities = require("skadic.lsp.handlers").capabilities,
	},
}

rust_tools.setup(opts)
