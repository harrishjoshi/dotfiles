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
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
          },
        },
      })

      vim.keymap.set("n", "<C-e>", function()
        local path = vim.fn.expand("%:p")
        if path == "" or vim.fn.isdirectory(path) == 1 then
          -- no file or directory buffer: use cwd
          vim.cmd("Neotree toggle left dir=" .. vim.fn.getcwd())
        else
          -- single file: root tree at file's parent folder
          vim.cmd("Neotree toggle left dir=" .. vim.fn.expand("%:p:h"))
        end
      end, { desc = "Toggle file explorer" })
    end
  }
