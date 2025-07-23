return {
  "ojroques/nvim-osc52",
  config = function()
    local osc52 = require("osc52")
    osc52.setup({
      max_length = 100000,
      silent = false,
      trim = false,
    })

    -- 自动复制函数（支持可视 + 普通模式）
    local function copy_to_clipboard()
      local mode = vim.api.nvim_get_mode().mode
      if mode == "v" or mode == "V" or mode == "\22" then -- 视觉模式
        -- 先执行普通 yank，再复制
        vim.cmd('normal! "vy')
        osc52.copy_register("v")
      else
        -- 普通模式直接复制到默认寄存器
        osc52.copy_register('"')
      end
    end

    -- 视觉模式下 y 替换为 yank + osc52
    vim.keymap.set("v", "y", function()
      copy_to_clipboard()
    end, { noremap = true, silent = true, desc = "Yank + OSC52" })

    -- 普通模式下 yy/yaw/yiw 都 hook，利用 TextYankPost autocmd
    vim.api.nvim_create_autocmd("TextYankPost", {
      callback = function()
        if vim.v.event.operator == "y" and vim.v.event.regname == "" then
          osc52.copy_register('"')
        end
      end,
      desc = "Auto OSC52 copy after yank",
    })
  end,
}

