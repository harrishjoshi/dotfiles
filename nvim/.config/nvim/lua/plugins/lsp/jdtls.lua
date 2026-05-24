return {
	"mfussenegger/nvim-jdtls",
	ft = "java",
	config = function()
		local jdtls = require("jdtls")
		local on_attach = require("plugins.lsp.utils.on_attach")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local home = os.getenv("HOME")
		local mason_path = home .. "/.local/share/nvim/mason"
		local jdtls_path = mason_path .. "/packages/jdtls"
		local config_path = jdtls_path .. "/config_linux"
		local plugins_path = jdtls_path .. "/plugins/"
		local jar_pattern = plugins_path .. "org.eclipse.equinox.launcher_*.jar"
		local jar = vim.fn.glob(jar_pattern)
		local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
		local workspace_dir = home .. "/.cache/nvim/jdtls/workspace/" .. project_name

		local config = {
			cmd = {
				"java",
				"-Declipse.application=org.eclipse.jdt.ls.core.id1",
				"-Dosgi.bundles.defaultStartLevel=4",
				"-Declipse.product=org.eclipse.jdt.ls.core.product",
				"-Dlog.protocol=true",
				"-Dlog.level=ALL",
				"-Xmx1g",
				"--add-modules=ALL-SYSTEM",
				"--add-opens",
				"java.base/java.util=ALL-UNNAMED",
				"--add-opens",
				"java.base/java.lang=ALL-UNNAMED",
				"-jar",
				jar,
				"-configuration",
				config_path,
				"-data",
				workspace_dir,
			},
			root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				java = {
					eclipse = {
						downloadSources = true,
					},
					configuration = {
						updateBuildConfiguration = "interactive",
					},
					maven = {
						downloadSources = true,
					},
					implementationsCodeLens = {
						enabled = true,
					},
					referencesCodeLens = {
						enabled = true,
					},
					references = {
						includeDecompiledSources = true,
					},
					format = {
						enabled = true,
					},
				},
				signatureHelp = { enabled = true },
				completion = {
					favoriteStaticMembers = {
						"org.junit.jupiter.api.Assertions.*",
						"org.junit.Assert.*",
						"org.mockito.Mockito.*",
					},
				},
			},
			init_options = {
				bundles = {},
			},
		}

		jdtls.start_or_attach(config)
	end,
}
