--vim.keymap.set("n", "<C-a>b", "<Cmd>lua print('hello world')<CR>", { silent = true})

vim.keymap.set("n", "<C-a>b", function ()
    print("hello world")
end, {silent = true})

-- 设置leaderkey
vim.g.mapleader = ";"


-- 插入模式下输入 jk 退出回到 normal 模式
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })

