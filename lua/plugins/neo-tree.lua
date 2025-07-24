return { 
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  opts = {
    git_status = {
      enabled = true,
      autorefresh = true,
    },
  },
  keys = {
    { "<leader>e", ":Neotree toggle<CR>", desc = "Toggle Neo-tree" },
  },
  config = function()
    vim.api.nvim_create_autocmd("FocusGained", {
      callback = function()
        require("neo-tree.sources.manager").refresh("filesystem")
      end,
      desc = "Refresh Neo-tree on focus gained",
    })

    vim.api.nvim_create_autocmd("ShellCmdPost", {
      callback = function()
        require("neo-tree.sources.manager").refresh("filesystem")
      end,
      desc = "Refresh Neo-tree after external shell commands",
    })
  end,
}

