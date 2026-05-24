return function(capabilities, on_attach)
	-- Go LSP setup with gopls
	vim.lsp.config("gopls", {
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			gopls = {
				-- Analyses provide extra static checks
				analyses = {
					unusedparams = true,
					nilness = true,
					unusedwrite = true,
					useany = true,
				},

				-- Enable staticcheck (recommended)
				staticcheck = true,

				-- Formatting and imports
				gofumpt = true,

				-- Workspace behavior
				completeUnimported = true,
				usePlaceholders = true,
				deepCompletion = true,

				-- Diagnostics scope (file or workspace)
				diagnosticMode = "workspace",

				-- Semantic tokens (usually on by default, explicit here)
				semanticTokens = true,
			},
		},
	})

	vim.lsp.enable("gopls")
end
