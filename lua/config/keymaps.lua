-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local opts = { silent = true }

-- Exiting insert mode
map("i", "jk", "<Esc>", opts)
map("i", "kj", "<Esc>", opts)

-- Switching to last buffer
map("n", "<C-b>", "<C-6>", opts)

-- Paste only last yanked text keybinds
map("n", "yp", '"0p', opts)
map("n", "yP", '"0P', opts)

-- Resizing window sizes
map("n", "<C-h>", ":vertical resize -2<CR>", opts)
map("n", "<C-k>", ":resize -2<CR>", opts)
map("n", "<C-j>", ":resize +2<CR>", opts)
map("n", "<C-l>", ":vertical resize +2<CR>", opts)

-- Switching between windows
map("n", "<A-h>", "<C-w>h", opts)
map("n", "<A-j>", "<C-w>j", opts)
map("n", "<A-k>", "<C-w>k", opts)
map("n", "<A-l>", "<C-w>l", opts)

-- Stopping lsp
map("n", "<leader>jL", "<cmd>LspStop<cr>", { desc = "stop lsp", silent = true })

-- Finding about the directories info
map("n", "<leader>jl", "<cmd>LazyRoot<cr>", { desc = "lazyroot command", silent = true })

-- Nvim-cmp goint to next line without selecting any entry
map("i", "<A-cr>", "<c-j>", { desc = "abort cmp then press enter", silent = true })

-- Changing cwd to directory of current buffer
map("n", "<leader>jd", "<cmd>lcd %:p:h<cr>", {desc = "change the cwd to directory of current buffer"})

-- Quiting neovim after saving without prompt
map({"n", "i"}, "<C-q>", "<cmd>wqa<cr>", {desc = "quit all after saving"})
map({"n", "i"}, "<C-S-q>", "<cmd>qa!<cr>", {desc = "quit all without saving"})

-- mapping for scrolling up and down
map("n", "<A-r>", "<C-y>", opts)
map("n", "<A-e>", "<C-e>", opts)

-- keymaps for manupulating window using nvim_window_picker
map("n", "<leader>jww", function()
  local winid = require("window-picker").pick_window()
  if winid then
    vim.api.nvim_set_current_win(winid)
  end
end, { desc = "switch window", silent = true })

map("n", "<A-;>", function()
  local winid = require("window-picker").pick_window()
  if winid then
    vim.api.nvim_set_current_win(winid)
  end
end, { silent = true, desc = "switch window" })

map("n", "<leader>jwd", function()
  local winid = require("window-picker").pick_window()
  if winid then
    vim.api.nvim_win_close(winid, true)
  end
end, { desc = "delete window", silent = true })

map("n", "<leader>jws", function()
  local windowid = require("window-picker").pick_window()
  local function swap_with(stay, winid)
    if not winid then
      return
    end

    local cur_winid = vim.fn.win_getid()

    local cur_bufnr = vim.api.nvim_win_get_buf(cur_winid)
    local target_bufnr = vim.api.nvim_win_get_buf(winid)

    vim.api.nvim_win_set_buf(cur_winid, target_bufnr)
    vim.api.nvim_win_set_buf(winid, cur_bufnr)

    if not stay then
      vim.api.nvim_set_current_win(winid)
    end
  end
  swap_with(true, windowid)
end, { desc = "swap window", silent = true })

-- fzflua changing keybindigs for navigation
vim.api.nvim_exec(
  [[
  augroup FzfCustomKeybindings
    autocmd!
    autocmd FileType fzf tnoremap <buffer> <C-j> <Down>
    autocmd FileType fzf tnoremap <buffer> <C-k> <Up>
  augroup END
]],
  false
)

-- Keymap for toggling winbar
map("n", "<leader>jb", function()
  -- local current_win = vim.fn.winnr()
  local winbar_exists = false

  -- Check if winbar exists
  for _, winid in ipairs(vim.fn.getwininfo()) do
    if winid.winbar == 1 then
      winbar_exists = true
      break
    end
  end
  if winbar_exists then
    vim.o.winbar = nil
  else
    vim.o.winbar = " %t %m"
  end
end, { desc = "toggle winbar", silent = true })

-- Keymap for toggling statusbar
map("n", "<leader>jx", function()
  if vim.o.laststatus == 3 then
    vim.o.laststatus = 0
    require("lualine").hide({ unhide = false })
    vim.api.nvim_set_hl(0, "Statusline", { fg = "#1b1d2b", bg = "#000000" })
    vim.api.nvim_set_hl(0, "StatuslineNC", { bold = true, fg = "#1b1d2b", bg = "#000000" })
    vim.cmd([[set statusline=%{repeat('─',winwidth('.'))}]])
  else
    require("lualine").hide({ unhide = true })
    vim.o.laststatus = 3
    vim.api.nvim_set_hl(0, "Statusline", {})
    vim.api.nvim_set_hl(0, "StatuslineNC", { fg = "#3b4261" })
  end
end, { desc = "toggle statusbar", silent = true })

-- -- Keymap for toggling both statusbar and winbar (removing this since ctrl-i is used in navigation)
-- map("n", "<C-i>", function()
--   if vim.o.laststatus == 3 then
--     vim.o.laststatus = 0
--     require("lualine").hide({ unhide = false })
--     vim.o.winbar = nil
--     vim.api.nvim_set_hl(0, "Statusline", { fg = "#1b1d2b", bg = "#000000" })
--     vim.api.nvim_set_hl(0, "StatuslineNC", { bold = true, fg = "#1b1d2b", bg = "#000000" })
--     vim.cmd([[set statusline=%{repeat('─',winwidth('.'))}]])
--   else
--     vim.o.winbar = " %t %m"
--     require("lualine").hide({ unhide = true })
--     vim.o.laststatus = 3
--     vim.api.nvim_set_hl(0, "Statusline", {})
--     vim.api.nvim_set_hl(0, "StatuslineNC", { fg = "#3b4261" })
--   end
-- end, { desc = "toggle statusbar", silent = true })

--mapping for toggling line numbers for all open windows
map("n", "<leader>ja", function()
  if vim.opt_local.number:get() or vim.opt_local.relativenumber:get() then
    -- vim.cmd([[windo if &filetype != 'noetree'| set nonumber | set norelativenumber | endif]])
    vim.cmd(
      [[let s:currentWindow = winnr() | windo if &filetype != 'neotree'| set nonumber | set norelativenumber | endif | execute s:currentWindow . "wincmd w"]]
    ) -- this helps in keeping focus to current window
  else
    -- vim.cmd([[windo if &filetype != 'noetree'| set number | set relativenumber | endif]])
    vim.cmd(
      [[let s:currentWindow = winnr() | windo if &filetype != 'neotree'| set number | set relativenumber | endif | execute s:currentWindow . "wincmd w"]]
    )
  end
end, { desc = "toggle lineno on all windows", silent = true })
