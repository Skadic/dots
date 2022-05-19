local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

local opts = {
    on_attach = require("skadic.lsp.handlers").on_attach,
    capabilities = require("skadic.lsp.handlers").capabilities,
}

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on spacific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)

    if server.name == "jsonls" then
        local jsonls_opts = require("skadic.lsp.settings.jsonls")
        opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    end

    if server.name == "sumneko_lua" then
        local sumneko_opts = require("skadic.lsp.settings.sumneko_lua")
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end

    if server.name == "rust_analyzer" then
        return
    end

    if server.name == "clangd" then
        return
    end
    -- This setup() function is exactly the same as lspconfig's setup function.
    server:setup(opts)
end)

-- Rust Tools
require("skadic.lsp.settings.rust_analyzer")
require("skadic.lsp.settings.clangd")
