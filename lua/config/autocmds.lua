-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Disable autoformat for lua files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "*" },
  callback = function()
    vim.b.autoformat = false
  end,
})

-- adding features in mini.files to open files in desirabe splits and selected window
local map_split = function(buf_id, lhs, direction)
  local rhs = function()
    -- Make new window and set it as target
    local new_target_window
    local windowid = require("window-picker").pick_window()
    -- vim.api.nvim_win_call(MiniFiles.get_target_window(), function()
    vim.api.nvim_win_call(windowid, function()
      vim.cmd(direction .. " split")
      new_target_window = vim.api.nvim_get_current_win()
    end)

    MiniFiles.set_target_window(new_target_window)
  end

  -- Adding `desc` will result into `show_help` entries
  local desc = "Split " .. direction
  vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
end

local map_select_window = function(buf_id, lhs)
  local rhs = function()
    -- Make new window and set it as target
    local new_target_window
    local windowid = require("window-picker").pick_window()
    -- vim.api.nvim_win_call(MiniFiles.get_target_window(), function()
    vim.api.nvim_win_call(windowid, function()
      new_target_window = vim.api.nvim_get_current_win()
    end)

    MiniFiles.set_target_window(new_target_window)
  end

  -- Adding `desc` will result into `show_help` entries
  local desc = "open in selected window"
  vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
end

vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesBufferCreate",
  callback = function(args)
    local buf_id = args.data.buf_id
    -- Tweak keys to your liking
    map_split(buf_id, "<S-s>", "belowright horizontal")
    map_split(buf_id, "<C-s>", "belowright vertical")
    map_select_window(buf_id, "<C-w>")
  end,
})

-- feature to on winbar only when there is multiple splits (working but not needed)
-- vim.api.nvim_create_autocmd({ "WinNew", "ExitPre"}, {
--   callback = function()
--     local win_num = #vim.api.nvim_list_wins()
--     if win_num > 1 then
--       vim.o.winbar = " %t %m"
--     else
--       vim.o.winbar = nil
--     end
--   end,
-- })

-- feature to disable lualine on first buf entry(immitating vim startup) only once (working)
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  once = true,
  callback = function()
    -- if vim.o.laststatus == 3 then
    vim.o.laststatus = 0
    require("lualine").hide({ unhide = false })
    vim.api.nvim_set_hl(0, "Statusline", { fg = "#1b1d2b", bg = "#000000" })
    vim.api.nvim_set_hl(0, "StatuslineNC", { bold = true, fg = "#1b1d2b", bg = "#000000" })
    vim.cmd([[set statusline=%{repeat('─',winwidth('.'))}]])
    -- end
  end,
})

vim.api.nvim_del_augroup_by_name("lazyvim_resize_splits") -- disabling the split resizing after terminal resizing

-- Adding custom compile commads for respective file-types
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "cpp" },
  callback = function()
    vim.keymap.set(
      "n",
      "<C-x>",
      -- "<cmd>:w <bar> silent !g++ -O2 % &>%:p:h/out.txt -o %:p:h/%:r.out && %:p:h/%:r.out < %:p:h/in.txt &> %:p:h/out.txt <cr>",
      "<cmd>:w <bar> silent !g++ % &>%:p:h/out.txt -o %:p:h/bin.out && %:p:h/bin.out < %:p:h/in.txt &> %:p:h/out.txt <cr>",
      { desc = "cpp compilation" }
    )
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "c" },
  callback = function()
    vim.keymap.set(
      "n",
      "<C-x>",
      -- "<cmd>:w <bar> silent !gcc -O2 % &>%:p:h/out.txt -o %:p:h/%:r.out && %:p:h/%:r.out < %:p:h/in.txt &> %:p:h/out.txt <cr>",
      "<cmd>:w <bar> silent !gcc % &>%:p:h/out.txt -o %:p:h/bin.out && %:p:h/bin.out < %:p:h/in.txt &> %:p:h/out.txt <cr>",
      { desc = "c compilation" }
    )
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "c", "cpp" },
  callback = function()
    vim.keymap.set(
      "n",
      "<C-S-x>",
      -- "<cmd>:!%:p:h/%:r.out < %:p:h/in.txt &> %:p:h/out.txt <cr>",
      "<cmd>:!%:p:h/bin.out < %:p:h/in.txt &> %:p:h/out.txt <cr>",
      { desc = "c,cpp binary exec" }
    )
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "python" },
  callback = function()
    vim.keymap.set("n", "<C-x>", "<cmd>silent !python % < %:p:h/in.txt &> %:p:h/out.txt <cr>", { desc = "node exec" })
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "javascript" },
  callback = function()
    vim.keymap.set("n", "<C-x>", "<cmd>:w <bar> silent !node % &> %:p:h/out.txt <cr>", { desc = "node exec" })
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "rust" },
  callback = function()
    vim.keymap.set(
      "n",
      "<C-x>",
      "<cmd>:w <bar> silent !rustc % &>%:p:h/out.txt -o %:p:h/%:r && %:p:h/%:r < %:p:h/in.txt &> %:p:h/out.txt <cr>",
      { desc = "node exec" }
    )
  end,
})
