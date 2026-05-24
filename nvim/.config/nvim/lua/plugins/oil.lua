return {
	"stevearc/oil.nvim",
	dependencies = {
		{ "echasnovski/mini.icons", lazy = false },
		{ "nvim-tree/nvim-web-devicons" },
	},
	config = function()
		local oil = require("oil")
		oil.setup({
			-- suppress cwd change prompt when file is outside cwd
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
			},
		})
		vim.keymap.set("n", "-", oil.toggle_float, {})
	end,
	lazy = false,
}
