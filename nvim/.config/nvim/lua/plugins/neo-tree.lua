return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	config = function()
		require("neo-tree").setup({
			window = {
				-- sidebar width in columns
				width = 30,
			},
			filesystem = {
				filtered_items = {
					-- show dotfiles dimmed instead of hiding them
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = false,
				},
				-- don't prompt to change cwd when revealing files outside cwd
				bind_to_cwd = false,
				-- don't use file watcher to avoid cwd change prompts
				use_libuv_file_watcher = false,
				follow_current_file = {
					-- highlight the active file in tree when switching buffers
					enabled = true,
				},
			},
		})

		-- toggle file tree and reveal current file
		vim.keymap.set("n", "<C-e>", ":Neotree toggle left reveal<CR>", { desc = "Toggle file explorer" })

		-- open file tree on startup
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				if vim.fn.argc() == 0 then
					-- no file opened: show tree, keep focus in tree
					vim.cmd("Neotree show left")
				else
					-- file opened: show tree and reveal the file, keep focus on file
					vim.cmd("Neotree show left reveal")
				end
			end,
		})
	end,
}
