local server_opts = {
  on_attach = require("skadic.lsp.handlers").on_attach,
}
server_opts.capabilities = vim.tbl_deep_extend(
  "force",
  { require("skadic.lsp.handlers").capabilities },
  { offsetEncoding = "utf-8" }
)

server_opts.capabilities.offset_encoding = "utf-8"
server_opts.capabilities.offsetEncoding = "utf-8"
return { server = server_opts }
