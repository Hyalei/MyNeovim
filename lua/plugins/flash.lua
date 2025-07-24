return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        label = {
            --style = "inline",
            before = true,     -- 在目标字符之前显示提示词
            after = false,
        },
    },
    keys = {
    { "<leader>f", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "<leader>F", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  },
}

