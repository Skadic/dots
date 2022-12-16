local mason_status_ok, mason_lsp = pcall(require, "mason-lspconfig")

if not mason_status_ok then
	return
end

local opts = {}

mason_lsp.setup(opts)

mason_lsp.setup_handlers({
	-- default handler for any lsp that doesn't have a specific handler
	function(server_name)
		local server_cfg_status_ok, specific_opts = pcall(require, "skadic.lsp.settings." .. server_name)
		local server_opts = {
			on_attach = require("skadic.lsp.handlers").on_attach,
			capabilities = require("skadic.lsp.handlers").capabilities,
		}
		if server_cfg_status_ok then
			server_opts = vim.tbl_deep_extend("force", server_opts, specific_opts)
		end
		require("lspconfig")[server_name].setup(server_opts)
	end,
	-- targeted overrides for specific language servers
	["rust_analyzer"] = function()
    require("skadic.lsp.settings.rust_analyzer")
	end,
	["clangd"] = function()
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
		require("clangd_extensions").setup({
			server = server_opts,
		})
	end,
})
