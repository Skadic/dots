local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black.with({ extra_args = { "--fast" } }),
		-- formatting.yapf,
		formatting.stylua,
		--diagnostics.flake8,
		formatting.rustfmt.with({ extra_args = { "--edition=2021" } }),
		formatting.clang_format,
		--code_actions.gitsigns,
	},
})

--vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]])
