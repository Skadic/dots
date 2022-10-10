local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("skadic.lsp.lsp-installer")
require("skadic.lsp.mason")
require("skadic.lsp.handlers").setup()
require("skadic.lsp.null-ls")
