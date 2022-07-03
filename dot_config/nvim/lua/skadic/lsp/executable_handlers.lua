local M = {}

-- TODO: backfill this to template
M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- enable virtual text
		virtual_text = true,
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
			false
		)
	end
end

local function lsp_keymaps(bufnr)
  local wk_opts = { mode = "n", prefix="g", noremap = true, silent = true, buffer = bufnr }
  local wk = require "which-key"

  wk.register({
    d = {"<cmd>Telescope lsp_definitions<CR>", "Definition"},
    D = {"<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration"},
    r = {"<cmd>Telescope lsp_references<CR>", "References"},
    i = {"<cmd>Telescope lsp_implementations<CR>", "Implementation"},
    s = {"<cmd>Telescope lsp_document_symbols<CR>", "Document Symbols"},
    S = {"<cmd>Telescope lsp_workspace_symbols<CR>", "Document Symbols"},
  }, wk_opts)

  wk_opts.prefix = "<leader>l"
  wk.register({
    name = "Language Server",
    a = { "<cmd>CodeActionMenu<cr>", "Code Action" },
    h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
    d = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Show Line Diagnostic" },
    f = { "<cmd>lua vim.lsp.buf.formatting_sync()<cr>", "Format File" },
    r = { "<cmd>lua require('cosmic-ui').rename()<cr>", "Rename" },
    s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help"},
    D = { "<cmd>Telescope diagnostics<CR>", "Show Diagnostics List"},
    e = { "<Plug>(doge-generate)", "Generate Documentation"}
  }, wk_opts)

  wk_opts.prefix = ""
  wk.register({
    ["[d"] = {'<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', "Previous Diagnostic"},
    ["]d"] = {'<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', "Next Diagnostic"},
  }, wk_opts)
end

local disable_format = { tsserver = 1, clangd = 1, sumneko_lua = 1, rust_analyzer = 1 }

M.on_attach = function(client, bufnr)
	if disable_format[client.name] == 1 then
		client.resolved_capabilities.document_formatting = false
	end

	lsp_keymaps(bufnr)
	lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
