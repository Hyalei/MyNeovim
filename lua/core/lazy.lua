-- 启用 true color（必须，确保高亮颜色生效）
vim.opt.termguicolors = true

-- 设置 lazy.nvim 路径
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- 如果没安装 lazy.nvim，就自动 clone
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- 判断当前系统是否是Linux
local is_linux = vim.loop.os_uname().sysname == "Linux"
-- 调用 lazy.setup，加载插件
require("lazy").setup({
    spec = {
        { import = "plugins" },
        -- 如果是linux系统，额外导入lua/core/linux下的插件配置
        is_linux and { import = "core.linux" } or nil,
  },
})

