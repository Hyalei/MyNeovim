return {
    "akinsho/bufferline.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"   -- 美化图标（可选）
    },
    opts = {},
    keys = {
        { "<Tab>", ":BufferLineCyclePrev<CR>", silent = true},
        { "<S-Tabl>", ":BufferLineCycleNext<CR>", silent = true},
        { "<leader>bp", ":BufferLinePick<CR>", silent = true},
        { "<leader>bc", ":BufferLinePickClose<CR>", silent = true},
        { "<leader>bo", ":BufferLinePickCloseOthers<CR>", silent = true},
    },
    lazy = false,   -- 禁止懒加载
}
