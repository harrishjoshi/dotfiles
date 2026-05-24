return function(capabilities, on_attach)
	-- Lua LSP setup
	vim.lsp.config("lua_ls", {
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	})

	vim.lsp.enable("lua_ls")
end
