--vim.keymap.set("n", "<C-a>b", "<Cmd>lua print('hello world')<CR>", { silent = true})

vim.keymap.set("n", "<C-a>b", function ()
    print("hello world")
end, {silent = true})

-- 设置leaderkey
vim.g.mapleader = ";"




