return {
  "sindrets/diffview.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("diffview").setup()
  end,
  keys = {
    {
      "<leader>gd",
      function()
        local lib = require("diffview.lib")
        if lib.get_current_view() then
          vim.cmd("DiffviewClose")
        else
          vim.cmd("DiffviewOpen")
        end
      end,
      desc = "Toggle Git Diff View",
    },
  },
}

