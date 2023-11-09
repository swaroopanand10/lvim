-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local opts = { silent = true }

-- for exiting insert mode
map("i", "jk", "<Esc>", opts)
map("i", "kj", "<Esc>", opts)

-- for switching to last buffer
map("n", "<C-b>", "<C-6>", opts)

-- for resizing window sizes
map("n", "<C-h>", ":vertical resize -2<CR>", opts)
map("n", "<C-k>", ":resize -2<CR>", opts)
map("n", "<C-j>", ":resize +2<CR>", opts)
map("n", "<C-l>", ":vertical resize +2<CR>", opts)

--for switching between windows
map("n", "<A-h>", "<C-w>h", opts)
map("n", "<A-j>", "<C-w>j", opts)
map("n", "<A-k>", "<C-w>k", opts)
map("n", "<A-l>", "<C-w>l", opts)
map("n", "<leader>jL", "<cmd>LspStop<cr>", { desc = "stop lsp", silent = true })
map("n", "<leader>jl", "<cmd>LazyRoot<cr>", { desc = "lazyroot command", silent = true })

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
end, {silent = true});

map("n", "<leader>jwd", function()
  print("hello world")
  local winid = require("window-picker").pick_window()
  if winid then
    vim.api.nvim_win_close(winid, true)
  end
end, { desc = "delete window", silent = true })

map("n", "<leader>jws", function()
  print("hello world")
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


-- -- mappings for neorg
-- local neorg_callbacks = require("neorg.core.callbacks")
--
-- neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
--     -- Map all the below keybinds only when the "norg" mode is active
--     keybinds.map_event_to_mode("norg", {
--         n = { -- Bind keys in normal mode
--             { "<leader>jna", "core.integrations.telescope.insert_file_link" },
--             { "<leader>jne", "core.integrations.telescope.insert_link" },
--         },
--
--         i = { -- Bind in insert mode
--             -- { "<C-.>", "core.integrations.telescope.insert_link" },
--             -- { "<C-,>", "core.integrations.telescope.insert_file_link" },
--         },
--     }, {
--         desc = "insert link",
--         silent = true,
--         noremap = true,
--     })
-- end)

-- keympas for custom cumpilation
vim.cmd(
  [[autocmd filetype cpp nnoremap <F9> :w <bar> silent !g++ -O2 % &>%:p:h/out.txt -o %:p:h/a.out && %:p:h/a.out < %:p:h/in.txt &> %:p:h/out.txt <Enter><CR>]]
)
vim.cmd(
  [[autocmd filetype c nnoremap <F9> :w <bar> silent !gcc -O2 % &>%:p:h/out.txt -o %:p:h/a.out && %:p:h/a.out < %:p:h/in.txt &> %:p:h/out.txt <Enter><CR>]]
)
vim.cmd([[autocmd filetype cpp nnoremap <C-x> :!%:p:h/a.out < %:p:h/in.txt &> %:p:h/out.txt <Enter><CR>]])
vim.cmd([[ autocmd filetype python nnoremap <C-x> :w <bar> !python % < %:p:h/in.txt &> %:p:h/out.txt <Enter><CR> ]]) -- had to change the shortcut form C-c to C-x so that i can cancel the buggy code at any time
vim.cmd([[ autocmd filetype javascript nnoremap <C-x> :w <bar> !node % &> %:p:h/out.txt <Enter><CR> ]]) -- had to change the shortcut form C-c to C-x so that i can cancel the buggy code at any time
