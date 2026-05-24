return function(client, bufnr)
	local opts = { buffer = bufnr, silent = true }

	-- Navigation
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)

	-- Documentation
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

	-- Code actions
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action, opts)

	-- Refactoring
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

	-- Workspace
	vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
	vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)

	-- Diagnostics
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
end
