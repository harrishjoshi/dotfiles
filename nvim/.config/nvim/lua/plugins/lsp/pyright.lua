return function(capabilities, on_attach)
	-- Python LSP setup with Pyright
	vim.lsp.config("pyright", {
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			disableOrganizeImports = true,
			pyright = {
				python = {
					analysis = {
						autoSearchPaths = true,
						useLibraryCodeForTypes = true,
						diagnosticMode = "workspace",
						typeCheckingMode = "basic",
					},
				},
			},
		},
	})

	vim.lsp.enable("pyright")
end
